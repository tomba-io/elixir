defmodule Tomba do
  alias Validation.Domainvalidation
  alias Validation.Keyvalidation
  use HTTPotion.Base

  @moduledoc """
  Documentation for `Tomba`.

  Tomba: Tomba.io is an Email Finder for B2B sales and email marketing
  This is the Lua client library for the [Email Finder](https://tomba.io) API.
  It allows you to lookup the following details :
  - [Domain Search](https://tomba.io/domain-search) (Search emails are based on the website You give one domain name and it returns all the email addresses found on the internet.)
  - [Email Finder](https://tomba.io/email-finder) (This API endpoint generates or retrieves the most likely email address from a domain name, a first name and a last name..)
  - [Email Verifier](https://tomba.io/email-verifier) (checks the deliverability of a given email address, verifies if it has been found in our database, and returns their sources.)
  - [Email Sources](https://developer.tomba.io/#email-sources) (Find email address source somewhere on the web .)
  - [Company Domain autocomplete](https://developer.tomba.io/#autocomplete) (Company Autocomplete is an API that lets you auto-complete company names and retrieve logo and domain information.)
  """

  # DEFAULT BASE URL

  @default_base_url "https://api.tomba.io/v1/"

  def default_base_url, do: @default_base_url

  # Account path

  @account_path "/me"

  def account_path, do: @account_path

  # Usage path

  @usage_path "/usage"

  def usage_path, do: @usage_path

  # Logs path

  @logs_path "/logs"

  def logs_path, do: @logs_path

  # Search path

  @search_path "/domain-search"

  def search_path, do: @search_path

  # Finder path

  @finder_path "/email-finder"

  def finder_path, do: @finder_path

  # Verifier path

  @verifier_path "/email-verifier"

  def verifier_path, do: @verifier_path

  # Email Sources path

  @sources_path "/email-sources"

  def sources_path, do: @sources_path

  # Email Count path

  @count_path "/email-count"

  def count_path, do: @count_path

  # Domain status path

  @status_path "/domain-status"

  def status_path, do: @status_path

  # Autocomplete path

  @autocomplete_path "/domains-suggestion"

  def autocomplete_path, do: @autocomplete_path

  defstruct key: "",
            secret: "",
            baseUrl: ""

  @doc """
  Tomba Constructor

  ## Parameters

    * `key` -  Tomba api key.
    * `secret` - Tomba secret key.
  """
  def new(key, secret) do
    Keyvalidation.validate(key)
    Keyvalidation.validate(secret)
    %Tomba{
      key: key,
      secret: secret,
      baseUrl: @default_base_url
    }
  end

  @doc """
  call to server

  ## Parameters

    * `this`  - Tomba
    * `path`  - A string specific path.
    * `params`- query params
  """
  def call(this, path, params) do
    header = [
      "User-Agent": "Tomba elixir-client",
      "Content-Type": "application/json",
      "X-Tomba-Key": this.key,
      "X-Tomba-Secret": this.secret
    ]

    req = HTTPotion.get(this.baseUrl <> path, query: params, headers: header)

    if req.status_code != 200 do
      {:error, Jason.decode!(req.error, keys: :atoms)}
    else
      {:ok, Jason.decode!(req.body, keys: :atoms)}
    end
  end

  @doc """
  Returns information about the current account.

  ## Parameters

    * `this`  - Tomba

    ## Examples

  ```ex
  {:ok, result} = Tomba.account(Tomba)

  ```
  """
  def account(this) do
    call(this, @account_path, nil)
  end

  @doc """
  Search emails are based on the website You give one domain name and it returns all the email addresses found on the internet.

  ## Parameters

    * `this`  - Tomba
    * `domain`  - A string specific domain.

    ## Examples

  ```ex
  {:ok, result} = Tomba.domain_search(Tomba,"tomba.io")

  ```
  """
  def domain_search(this, domain) do
    Domainvalidation.validate(domain)
    call(this, @search_path, %{"domain" => domain})
  end

  @doc """
  Returns total email addresses we have for one domain.

  ## Parameters

    * `this`  - Tomba
    * `domain`  - A string specific domain.

    ## Examples

  ```ex
  {:ok, result} = Tomba.count(Tomba,"tomba.io")

  ```
  """
  def count(this, domain) do
    Domainvalidation.validate(domain)
    call(this, @count_path, %{"domain" => domain})
  end

  @doc """
  Returns domain status if is webmail or disposable.

  ## Parameters

    * `this`  - Tomba
    * `domain`  - A string specific path.

    ## Examples

  ```ex
  {:ok, result} = Tomba.status(Tomba,"gmail.com")

  ```
  """
  def status(this, domain) do
    Domainvalidation.validate(domain)
    call(this, @status_path, %{"domain" => domain})
  end

  @doc """
  Company Autocomplete is an API that lets you auto-complete company names and retrieve logo and domain information.

  ## Parameters

    * `this`  - Tomba
    * `query`  - A string name company or website.

    ## Examples

  ```ex
  {:ok, result} = Tomba.autocomplete(Tomba,"google")

  ```
  """
  def autocomplete(this, query) do
    call(this, @autocomplete_path, %{"query" => query})
  end

  @doc """
  Generates or retrieves the most likely email address from a domain name, a first name and a last name.

  ## Parameters

    * `this`  - Tomba
    * `domain` -   A string domain name of the company, used for emails. For example, "tomba.com".
    * `fname`  -  A string The person's first name. It doesn't need to be in lowercase.
    * `lname`  -  A string The person's last name. It doesn't need to be in lowercase.

    ## Examples

  ```ex
  {:ok, result} = Tomba.email_finder(Tomba,"stripe.com", "fname", "lname")

  ```
  """
  def email_finder(this, domain, fname, lname) do
    Domainvalidation.validate(domain)
    call(this, @finder_path, %{"domain" => domain, "fisrt_name" => fname, "last_name" => lname})
  end

  @doc """
  Verify the deliverability of an email address.

  ## Parameters

    * `this`   - Tomba
    * `email`  - A string email address you want to verify.

    ## Examples

  ```ex
  {:ok, result} = Tomba.email_verifier(Tomba,"b.mohamed@tomba.io")

  ```
  """
  def email_verifier(this, email) do
    call(this, @verifier_path <> email, nil)
  end

  @doc """
  Find email address source somewhere on the web.

  ## Parameters

    * `this`   - Tomba
    * `email`  - A string email address you want to find sources.

    ## Examples

  ```ex
  {:ok, result} = Tomba.email_sources(Tomba,"b.mohamed@tomba.io")

  ```
  """
  def email_sources(this, email) do
    call(this, @sources_path <> email, nil)
  end

  @doc """
  Check your monthly requests.

  ## Parameters

    * `this`  - Tomba

    ## Examples

  ```ex
  {:ok, result} = Tomba.usage(Tomba)

  ```
  """
  def usage(this) do
    call(this, @usage_path, nil)
  end

  @doc """
  Returns a your last 1,000 requests you made during the last 3 months.

  ## Parameters

    * `this`  - Tomba

    ## Examples

  ```ex
  {:ok, result} = Tomba.logs(Tomba)

  ```
  """
  def logs(this) do
    call(this, @logs_path, nil)
  end
end
