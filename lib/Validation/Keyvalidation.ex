defmodule Validation.Keyvalidation do
  @moduledoc """

  #  Tomba email finder elixir Client Library
  Tomba: Tomba.io is an Email Finder for B2B sales and email marketing
  This is the Lua client library for the [Email Finder](https://tomba.io) API.
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
