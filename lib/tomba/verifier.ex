defmodule Tomba.Verifier do
  @moduledoc """
  Email Verifier API for Tomba.

  Check the deliverability of an email address, verify if it has been
  found in our database, and return their sources.

  See [Email Verifier API](https://docs.tomba.io/api/verifier) for details.
  """

  alias Tomba.Client

  @doc """
  Verify the deliverability of an email address.

  The email is passed as a query parameter, not a path parameter.

  See [Email Verifier](https://docs.tomba.io/api/verifier#email-verifier).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to verify.
      * `"webhook_url"` (optional) - Webhook URL for async results.

  ## Examples

      iex> Tomba.Verifier.email_verifier(client, %{"email" => "b.mohamed@tomba.io"})
      {:ok, %{"data" => %{"email" => %{"result" => "deliverable", ...}}}}

  """
  @spec email_verifier(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_verifier(%Client{} = client, %{"email" => _} = params) do
    Client.get(client, "/email-verifier", params)
  end
end
