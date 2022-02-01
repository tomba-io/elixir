defmodule Validation.Keyvalidation do
  @moduledoc """

  #  Tomba email finder elixir Client Library
  Tomba: Tomba.io is an Email Finder for B2B sales and email marketing
  This is the Lua client library for the [Email Finder](https://tomba.io) API.
  It allows you to lookup the following details :
  - [Domain Search](https://tomba.io/domain-search) (Search emails are based on the website You give one domain name and it returns all the email addresses found on the internet.)
  - [Email Finder](https://tomba.io/email-finder) (This API endpoint generates or retrieves the most likely email address from a domain name, a first name and a last name..)
  - [Email Verifier](https://tomba.io/email-verifier) (checks the deliverability of a given email address, verifies if it has been found in our database, and returns their sources.)
  - [Email Sources](https://developer.tomba.io/#email-sources) (Find email address source somewhere on the web .)
  - [Company Domain autocomplete](https://developer.tomba.io/#autocomplete) (Company Autocomplete is an API that lets you auto-complete company names and retrieve logo and domain information.)
  ## Documentation for Key validation.
  """
  @moduledoc since: "0.1.0"

  @doc """
   Helper method for validating tomba key and secret

   ## Parameters
     * `str` -  Tomba api key or api secret.

  """
  @doc since: "0.1.0"
  def validate(str) do
    if String.length(str) < 39 do
      raise "Invalid Tomba credentials"
    end
  end
end
