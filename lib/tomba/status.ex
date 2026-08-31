defmodule Tomba.Status do
  @moduledoc """
  Domain Status and Domain Suggestions APIs for Tomba.

  Check domain status (webmail, disposable) and get company autocomplete suggestions.

  See [Domain Status API](https://docs.tomba.io/api/domain#domain-status) for details.
  """

  alias Tomba.Client

  @doc """
  Get the status of a domain (webmail, disposable, etc.).

  See [Domain Status](https://docs.tomba.io/api/domain#domain-status#domain-status).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to check (e.g., "gmail.com").

  ## Examples

      iex> Tomba.Status.domain_status(client, %{"domain" => "gmail.com"})
      {:ok, %{"data" => %{"webmail" => true, "disposable" => false, ...}}}

  """
  @spec domain_status(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def domain_status(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/domain-status", params)
  end

  @doc """
  Get company autocomplete suggestions.

  See [Domain Suggestions](https://docs.tomba.io/api/domain#domain-status#company-autocomplete).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"query"` (required) - The search query (e.g., "google").

  ## Examples

      iex> Tomba.Status.domain_suggestions(client, %{"query" => "google"})
      {:ok, %{"data" => [%{"domain" => "google.com", ...}]}}

  """
  @spec domain_suggestions(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def domain_suggestions(%Client{} = client, %{"query" => _} = params) do
    Client.get(client, "/domain-suggestions", params)
  end
end
