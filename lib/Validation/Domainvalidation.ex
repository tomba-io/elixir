defmodule Validation.Domainvalidation do
  @moduledoc """

  #  Tomba email finder elixir Client Library
  Tomba: Tomba.io is an Email Finder for B2B sales and email marketing
  This is the Lua client library for the [Email Finder](https://tomba.io) API.
  ## Documentation for Domain validation.
  """
  @moduledoc since: "0.1.0"

  @doc """
   Helper method for validating domain name

   ## Parameters
     * `domain` -  passing in a single website name domain name

  """
  @doc since: "0.1.0"
  def validate(domain) do
    regex = ~r/^(?!\-)(?:[a-zA-Z\d\-]{0,62}[a-zA-Z\d]\.){1,126}(?!\d+)[a-zA-Z\d]{1,63}$/

    if String.match?(domain, regex) == false do
      raise "Invalid Domain name"
    end
  end
end
