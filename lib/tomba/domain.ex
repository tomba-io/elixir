defmodule Tomba.Domain do
  @moduledoc """
  Domain Search API for Tomba.

  Search emails based on a website domain. Returns all email addresses
  found on the internet for a given domain name.

  See [Domain Search API](https://docs.tomba.io/api/finder#domain-search) for details.
  """

  alias Tomba.Client

  @doc """
  Search emails for a given domain.

  See [Domain Search](https://docs.tomba.io/api/finder#domain-search#domain-search).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to search (e.g., "tomba.io").
      * `"page"` (optional) - Page number for pagination.
      * `"limit"` (optional) - Number of results per page.
      * `"department"` (optional) - Filter by department.
      * `"country"` (optional) - Filter by country.
      * `"enrich_mobile"` (optional) - Enrich with mobile phone data.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Domain.domain_search(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => %{"emails" => [...]}}}

      iex> Tomba.Domain.domain_search(client, %{"domain" => "tomba.io", "page" => 1, "limit" => 10})
      {:ok, %{"data" => %{"emails" => [...]}}}

  """
  @spec domain_search(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def domain_search(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/domain-search", params)
  end
end
