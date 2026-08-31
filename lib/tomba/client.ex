defmodule Tomba.Client do
  @moduledoc """
  HTTP client for the Tomba API.

  Handles authentication, request building, and response parsing.
  Supports GET, POST, PUT, and DELETE methods.

  See [API Introduction](https://docs.tomba.io/api/introduction) for details.
  """

  @type t :: %__MODULE__{
          key: String.t(),
          secret: String.t(),
          base_url: String.t(),
          timeout: pos_integer()
        }

  @enforce_keys [:key, :secret]
  defstruct key: "",
            secret: "",
            base_url: "https://api.tomba.io/v1",
            timeout: 120_000

  @rate_limit_headers [
    "x-second-rate-limit",
    "x-minute-rate-limit",
    "x-daily-rate-limit",
    "x-minute-request-left",
    "x-daily-request-left",
    "x-minute-reset-seconds",
    "x-daily-reset-seconds",
    "retry-after",
    "ratelimit-policy",
    "ratelimit"
  ]

  @sdk_version "tomba:elixir:v1.0.0"

  @doc """
  Creates a new client struct.

  ## Parameters

    * `key` - Your Tomba API key.
    * `secret` - Your Tomba API secret.
    * `opts` - Optional keyword list:
      * `:base_url` - Custom API base URL.
      * `:timeout` - Request timeout in milliseconds.

  ## Examples

      client = Tomba.Client.new("ta_xxxx", "ts_xxxx")
      client = Tomba.Client.new("ta_xxxx", "ts_xxxx", timeout: 60_000)

  """
  @spec new(String.t(), String.t(), keyword()) :: t()
  def new(key, secret, opts \\ []) do
    %__MODULE__{
      key: key,
      secret: secret,
      base_url: Keyword.get(opts, :base_url, "https://api.tomba.io/v1"),
      timeout: Keyword.get(opts, :timeout, 120_000)
    }
  end

  @doc """
  Performs a GET request to the Tomba API.

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `path` - The API endpoint path (e.g., "/me").
    * `params` - Query parameters as a map (default: `%{}`).

  ## Examples

      Tomba.Client.get(client, "/me")
      Tomba.Client.get(client, "/domain-search", %{"domain" => "tomba.io"})

  """
  @spec get(t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get(%__MODULE__{} = client, path, params \\ %{}) do
    request(client, :get, path, params: params)
  end

  @doc """
  Performs a POST request to the Tomba API.

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `path` - The API endpoint path.
    * `body` - Request body as a map (default: `%{}`).

  ## Examples

      Tomba.Client.post(client, "/keys", %{})

  """
  @spec post(t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def post(%__MODULE__{} = client, path, body \\ %{}) do
    request(client, :post, path, json: body)
  end

  @doc """
  Performs a PUT request to the Tomba API.

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `path` - The API endpoint path.
    * `body` - Request body as a map (default: `%{}`).

  ## Examples

      Tomba.Client.put(client, "/keys/123", %{})

  """
  @spec put(t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def put(%__MODULE__{} = client, path, body \\ %{}) do
    request(client, :put, path, json: body)
  end

  @doc """
  Performs a DELETE request to the Tomba API.

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `path` - The API endpoint path.

  ## Examples

      Tomba.Client.delete(client, "/keys/123")

  """
  @spec delete(t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete(%__MODULE__{} = client, path) do
    request(client, :delete, path, [])
  end

  defp request(%__MODULE__{} = client, method, path, opts) do
    url = client.base_url <> path
    headers = build_headers(client)
    {body, query_params} = extract_request_parts(opts)
    full_url = build_url(url, query_params)
    encoded_body = encode_body(body)
    http_opts = [timeout: client.timeout, recv_timeout: client.timeout]

    method
    |> do_request(full_url, encoded_body, headers, http_opts)
    |> handle_response()
  end

  defp build_headers(%__MODULE__{} = client) do
    [
      {"X-Tomba-Key", client.key},
      {"X-Tomba-Secret", client.secret},
      {"Content-Type", "application/json"},
      {"User-Agent", @sdk_version}
    ]
  end

  defp build_url(url, params) when params == %{}, do: url
  defp build_url(url, params), do: url <> "?" <> URI.encode_query(params)

  defp encode_body(nil), do: ""
  defp encode_body(body), do: Jason.encode!(body)

  defp do_request(:get, url, _body, headers, opts), do: HTTPoison.get(url, headers, opts)
  defp do_request(:post, url, body, headers, opts), do: HTTPoison.post(url, body, headers, opts)
  defp do_request(:put, url, body, headers, opts), do: HTTPoison.put(url, body, headers, opts)
  defp do_request(:delete, url, _body, headers, opts), do: HTTPoison.delete(url, headers, opts)

  defp handle_response(
         {:ok, %HTTPoison.Response{status_code: status, headers: headers, body: raw_body}}
       )
       when status >= 200 and status <= 299 do
    {:ok, %{data: decode_body(raw_body), rate_limit: parse_rate_limit_headers(headers)}}
  end

  defp handle_response(
         {:ok, %HTTPoison.Response{status_code: status, headers: headers, body: raw_body}}
       ) do
    decoded = decode_body(raw_body)

    {:error,
     %Tomba.Error{
       message: extract_error_message(decoded),
       status_code: status,
       response: %{data: decoded, rate_limit: parse_rate_limit_headers(headers)}
     }}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error,
     %Tomba.Error{
       message: "Transport error: #{inspect(reason)}",
       status_code: 0,
       response: nil
     }}
  end

  defp parse_rate_limit_headers(headers) do
    headers
    |> Enum.filter(fn {key, _value} ->
      String.downcase(key) in @rate_limit_headers
    end)
    |> Enum.map(fn {key, value} -> {String.downcase(key), value} end)
    |> Map.new()
  end

  defp extract_request_parts(opts) do
    json_body = Keyword.get(opts, :json)
    params = Keyword.get(opts, :params, %{})
    {json_body, params}
  end

  defp decode_body(""), do: %{}

  defp decode_body(body) when is_binary(body) do
    case Jason.decode(body) do
      {:ok, decoded} -> decoded
      {:error, _} -> body
    end
  end

  defp decode_body(body), do: body

  defp extract_error_message(%{"errors" => %{"message" => message}}), do: message
  defp extract_error_message(%{"message" => message}), do: message
  defp extract_error_message(body) when is_map(body), do: inspect(body)
  defp extract_error_message(body) when is_binary(body), do: body
  defp extract_error_message(_), do: "Unknown error"
end
