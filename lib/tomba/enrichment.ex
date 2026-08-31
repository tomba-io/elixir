defmodule Tomba.Enrichment do
  @moduledoc """
  Enrichment API for Tomba (Clearbit-compatible).

  Get person, company, or combined enrichment data.

  See [Enrichment API](https://docs.tomba.io/api/enrichment) for details.
  """

  alias Tomba.Client

  @doc """
  Get person data from an email address.

  See [Person Enrichment](https://docs.tomba.io/api/enrichment#person).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to look up.

  ## Examples

      iex> Tomba.Enrichment.person(client, %{"email" => "john@example.com"})
      {:ok, %{"data" => %{"first_name" => "John", ...}}}

  """
  @spec person(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def person(%Client{} = client, %{"email" => _} = params) do
    Client.get(client, "/people/find", params)
  end

  @doc """
  Get company data from a domain.

  See [Company Enrichment](https://docs.tomba.io/api/enrichment#company).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to look up (e.g., "example.com").

  ## Examples

      iex> Tomba.Enrichment.company(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => %{"name" => "Tomba", ...}}}

  """
  @spec company(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def company(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/companies/find", params)
  end

  @doc """
  Get combined person and company data from an email address.

  See [Combined Enrichment](https://docs.tomba.io/api/enrichment#combined).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to look up.

  ## Examples

      iex> Tomba.Enrichment.combined(client, %{"email" => "john@example.com"})
      {:ok, %{"data" => %{"person" => %{...}, "company" => %{...}}}}

  """
  @spec combined(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def combined(%Client{} = client, %{"email" => _} = params) do
    Client.get(client, "/combined/find", params)
  end
end
