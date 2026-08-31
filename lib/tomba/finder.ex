defmodule Tomba.Finder do
  @moduledoc """
  Email Finder, Author Finder, LinkedIn Finder, and Enrichment APIs for Tomba.

  See [Email Finder API](https://docs.tomba.io/api/finder#email-finder) for details.
  """

  alias Tomba.Client

  @doc """
  Find the most likely email address from a domain, first name, and last name.

  See [Email Finder](https://docs.tomba.io/api/finder#email-finder#email-finder).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name of the company (e.g., "stripe.com").
      * `"first_name"` (required) - The person's first name.
      * `"last_name"` (required) - The person's last name.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Finder.email_finder(client, %{"domain" => "stripe.com", "first_name" => "John", "last_name" => "Doe"})
      {:ok, %{"data" => %{"email" => "john.doe@stripe.com", ...}}}

  """
  @spec email_finder(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_finder(
        %Client{} = client,
        %{"domain" => _, "first_name" => _, "last_name" => _} = params
      ) do
    Client.get(client, "/email-finder", params)
  end

  @doc """
  Find the email address of an article author.

  See [Author Finder](https://docs.tomba.io/api/author-finder#author-finder).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"url"` (required) - The URL of the article.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Finder.author_finder(client, %{"url" => "https://example.com/article"})
      {:ok, %{"data" => %{"email" => "author@example.com", ...}}}

  """
  @spec author_finder(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def author_finder(%Client{} = client, %{"url" => _} = params) do
    Client.get(client, "/author-finder", params)
  end

  @doc """
  Find the email address associated with a LinkedIn profile.

  See [LinkedIn Finder](https://docs.tomba.io/api/linkedin-finder#linkedin-finder).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"url"` (required) - The LinkedIn profile URL.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Finder.linkedin_finder(client, %{"url" => "https://linkedin.com/in/johndoe"})
      {:ok, %{"data" => %{"email" => "john@example.com", ...}}}

  """
  @spec linkedin_finder(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def linkedin_finder(%Client{} = client, %{"url" => _} = params) do
    Client.get(client, "/linkedin", params)
  end

  @doc """
  Enrich data for an email address.

  See [Email Enrichment](https://docs.tomba.io/api/enrichment#enrichment).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to enrich.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Finder.email_enrichment(client, %{"email" => "john@example.com"})
      {:ok, %{"data" => %{...}}}

  """
  @spec email_enrichment(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_enrichment(%Client{} = client, %{"email" => _} = params) do
    Client.get(client, "/enrich", params)
  end
end
