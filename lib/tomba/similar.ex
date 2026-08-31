defmodule Tomba.Similar do
  @moduledoc """
  Similar Websites API for Tomba.

  Retrieve similar domains based on a specific domain.

  See [Similar API](https://docs.tomba.io/api/similar) for details.
  """

  alias Tomba.Client

  @doc """
  Find websites similar to a given domain.

  See [Similar Websites](https://docs.tomba.io/api/similar#similar-websites).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to find similar websites for.

  ## Examples

      iex> Tomba.Similar.websites(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => [%{"domain" => "similar.com", ...}]}}

  """
  @spec websites(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def websites(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/similar", params)
  end
end
