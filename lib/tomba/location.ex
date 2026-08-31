defmodule Tomba.Location do
  @moduledoc """
  Location API for Tomba.

  Get the geographic location of a domain.

  See [Location API](https://docs.tomba.io/api/finder#location) for details.
  """

  alias Tomba.Client

  @doc """
  Get the location of a domain.

  See [Location](https://docs.tomba.io/api/finder#location#location).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to get location for.

  ## Examples

      iex> Tomba.Location.get_location(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => %{"country" => "US", ...}}}

  """
  @spec get_location(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get_location(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/location", params)
  end
end
