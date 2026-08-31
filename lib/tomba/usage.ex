defmodule Tomba.Usage do
  @moduledoc """
  Usage API for Tomba.

  Get your account usage statistics.

  See [Usage API](https://docs.tomba.io/api/account#retrieve-api-usage) for details.
  """

  alias Tomba.Client

  @doc """
  Get your account usage statistics.

  See [Get Usage](https://docs.tomba.io/api/account#retrieve-api-usage#get-usage).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.Usage.get_usage(client)
      {:ok, %{"data" => %{"total" => 100, "used" => 42, ...}}}

  """
  @spec get_usage(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get_usage(%Client{} = client) do
    Client.get(client, "/usage")
  end
end
