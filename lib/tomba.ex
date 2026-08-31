defmodule Tomba do
  @moduledoc """
  Official Elixir client library for the Tomba Email Finder API.

  Tomba.io is an Email Finder for B2B sales and email marketing. This library
  provides access to the [Tomba API](https://docs.tomba.io/api/introduction),
  allowing you to:

    * [Domain Search](https://tomba.io/domain-search) - Search emails based on a domain name
    * [Email Finder](https://tomba.io/email-finder) - Generate or retrieve the most likely email address
    * [Email Verifier](https://tomba.io/email-verifier) - Check the deliverability of an email address
    * [Email Enrichment](https://tomba.io/enrichment) - Locate and include data in your emails
    * [Author Finder](https://tomba.io/author-finder) - Discover email addresses of article authors
    * [LinkedIn Finder](https://tomba.io/linkedin-finder) - Discover email addresses from LinkedIn profiles
    * [Phone Finder](https://tomba.io/phone-finder) - Find phone numbers associated with emails

  ## Getting Started

  Create a client with your API credentials:

      client = Tomba.client("ta_xxxx", "ts_xxxx")

  Then use it with any service module:

      {:ok, result} = Tomba.Account.account(client)
      {:ok, result} = Tomba.Domain.domain_search(client, %{"domain" => "tomba.io"})
      {:ok, result} = Tomba.Finder.email_finder(client, %{"domain" => "stripe.com", "first_name" => "John", "last_name" => "Doe"})

  ## Authentication

  You'll need a Tomba API access token. Sign up for a free account at
  [https://app.tomba.io/auth/register](https://app.tomba.io/auth/register).

  See [Authentication](https://docs.tomba.io/api/authentication) for details.
  """

  @type client :: Tomba.Client.t()

  @default_base_url "https://api.tomba.io/v1"

  @doc """
  Creates a new Tomba API client.

  ## Parameters

    * `key` - Your Tomba API key (starts with "ta_").
    * `secret` - Your Tomba API secret (starts with "ts_").
    * `opts` - Optional keyword list:
      * `:base_url` - Custom API base URL (default: `#{@default_base_url}`).
      * `:timeout` - Request timeout in milliseconds (default: 120_000).

  ## Examples

      client = Tomba.client("ta_xxxx", "ts_xxxx")
      client = Tomba.client("ta_xxxx", "ts_xxxx", base_url: "https://custom.api.com/v1")

  """
  @spec client(String.t(), String.t(), keyword()) :: client()
  def client(key, secret, opts \\ []) do
    Tomba.Client.new(key, secret, opts)
  end

  @doc """
  Returns the default API base URL.
  """
  @spec default_base_url() :: String.t()
  def default_base_url, do: @default_base_url
end
