defmodule Tomba.Technology do
  @moduledoc """
  Technology Finder API for Tomba.

  Retrieve the technologies used by a specific domain.

  See [Technology API](https://docs.tomba.io/api/domain#technology) for details.
  """

  alias Tomba.Client

  @doc """
  Get the technologies used by a domain.

  See [Technology](https://docs.tomba.io/api/domain#technology#technology).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to find technologies for.

  ## Examples

      iex> Tomba.Technology.list(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => [%{"name" => "Cloudflare", ...}]}}

  """
  @spec list(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/technology", params)
  end
end
