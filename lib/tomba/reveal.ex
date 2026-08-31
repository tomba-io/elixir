defmodule Tomba.Reveal do
  @moduledoc """
  Reveal API for Tomba.

  Search companies using reverse lookup (e.g., by IP address).

  See [Reveal API](https://docs.tomba.io/api/reveal) for details.
  """

  alias Tomba.Client

  @doc """
  Search companies using reverse lookup.

  See [Companies Search](https://docs.tomba.io/api/reveal#companies-search).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with search parameters (e.g., `%{"ip" => "1.2.3.4"}`).

  ## Examples

      iex> Tomba.Reveal.companies_search(client, %{"ip" => "1.2.3.4"})
      {:ok, %{"data" => %{"company" => %{...}}}}

  """
  @spec companies_search(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def companies_search(%Client{} = client, params \\ %{}) do
    Client.post(client, "/reveal/search", params)
  end
end
