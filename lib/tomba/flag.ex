defmodule Tomba.Flag do
  @moduledoc """
  Flag API for Tomba.

  List and create flagged email addresses.

  See [Flag API](https://docs.tomba.io/api/flag) for details.
  """

  alias Tomba.Client

  @doc """
  Get all flagged email addresses.

  See [List Flags](https://docs.tomba.io/api/flag#list-flags).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with optional keys:
      * `"page"` (optional) - Page number for pagination.
      * `"limit"` (optional) - Number of results per page.

  ## Examples

      iex> Tomba.Flag.list_flags(client)
      {:ok, %{"data" => [%{"email" => "spam@example.com", ...}]}}

      iex> Tomba.Flag.list_flags(client, %{"page" => 1, "limit" => 10})
      {:ok, %{"data" => [%{"email" => "spam@example.com", ...}]}}

  """
  @spec list_flags(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list_flags(%Client{} = client, params \\ %{}) do
    Client.get(client, "/flag", params)
  end

  @doc """
  Flag an email address.

  See [Create Flag](https://docs.tomba.io/api/flag#create-flag).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to flag.
      * `"reason"` (optional) - Reason for flagging.

  ## Examples

      iex> Tomba.Flag.create_flag(client, %{"email" => "spam@example.com", "reason" => "Invalid"})
      {:ok, %{}}

  """
  @spec create_flag(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create_flag(%Client{} = client, %{"email" => _} = params) do
    Client.post(client, "/flag", params)
  end
end
