defmodule Tomba.Logs do
  @moduledoc """
  Logs API for Tomba.

  Get your last 1,000 requests made during the last 3 months.

  See [Logs API](https://docs.tomba.io/api/account#retrieve-api-logs) for details.
  """

  alias Tomba.Client

  @doc """
  Get your account logs.

  See [Get Logs](https://docs.tomba.io/api/account#retrieve-api-logs#get-logs).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with optional keys:
      * `"page"` (optional) - Page number for pagination.
      * `"limit"` (optional) - Number of results per page.

  ## Examples

      iex> Tomba.Logs.get_logs(client)
      {:ok, %{"data" => [%{"endpoint" => "/domain-search", ...}]}}

      iex> Tomba.Logs.get_logs(client, %{"page" => 1, "limit" => 10})
      {:ok, %{"data" => [%{"endpoint" => "/domain-search", ...}]}}

  """
  @spec get_logs(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get_logs(%Client{} = client, params \\ %{}) do
    Client.get(client, "/logs", params)
  end
end
