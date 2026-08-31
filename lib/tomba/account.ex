defmodule Tomba.Account do
  @moduledoc """
  Account API for Tomba.

  See [Account API](https://docs.tomba.io/api/account) for details.
  """

  alias Tomba.Client

  @doc """
  Returns information about the current account.

  See [Get Account](https://docs.tomba.io/api/account#get-account).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.Account.account(client)
      {:ok, %{"data" => %{"email" => "user@example.com", ...}}}

  """
  @spec account(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def account(%Client{} = client) do
    Client.get(client, "/me")
  end
end
