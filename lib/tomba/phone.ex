defmodule Tomba.Phone do
  @moduledoc """
  Phone Finder and Phone Validator APIs for Tomba.

  Find phone numbers associated with email addresses and validate phone numbers.

  See [Phone API](https://docs.tomba.io/api/phone) for details.
  """

  alias Tomba.Client

  @doc """
  Find the phone number associated with an email address, domain, or LinkedIn URL.

  See [Phone Finder](https://docs.tomba.io/api/phone#phone-finder).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with one of the following keys:
      * `"email"` - The email address to find a phone number for.
      * `"domain"` - The domain to search.
      * `"url"` - A LinkedIn profile URL.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Phone.phone_finder(client, %{"email" => "john@example.com"})
      {:ok, %{"data" => %{"phone" => "+1234567890", ...}}}

      iex> Tomba.Phone.phone_finder(client, %{"domain" => "example.com"})
      {:ok, %{"data" => %{"phone" => "+1234567890", ...}}}

      iex> Tomba.Phone.phone_finder(client, %{"url" => "https://linkedin.com/in/johndoe"})
      {:ok, %{"data" => %{"phone" => "+1234567890", ...}}}

  """
  @spec phone_finder(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def phone_finder(%Client{} = client, params) when is_map(params) do
    Client.get(client, "/phone-finder", params)
  end

  @doc """
  Validate a phone number.

  See [Phone Validator](https://docs.tomba.io/api/phone#phone-validator).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"phone"` (required) - The phone number to validate.

  ## Examples

      iex> Tomba.Phone.phone_validator(client, %{"phone" => "+1234567890"})
      {:ok, %{"data" => %{"valid" => true, ...}}}

  """
  @spec phone_validator(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def phone_validator(%Client{} = client, %{"phone" => _} = params) do
    Client.get(client, "/phone-validator", params)
  end
end
