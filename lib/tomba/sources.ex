defmodule Tomba.Sources do
  @moduledoc """
  Email Sources API for Tomba.

  Find the sources where an email address was found on the web.

  See [Email Sources API](https://docs.tomba.io/api/email#email-sources) for details.
  """

  alias Tomba.Client

  @doc """
  Get the sources where an email address was found on the web.

  The email is passed as a query parameter, not a path parameter.

  See [Email Sources](https://docs.tomba.io/api/email#email-sources#email-sources).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"email"` (required) - The email address to find sources for.

  ## Examples

      iex> Tomba.Sources.email_sources(client, %{"email" => "b.mohamed@tomba.io"})
      {:ok, %{"data" => %{"sources" => [...]}}}

  """
  @spec email_sources(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_sources(%Client{} = client, %{"email" => _} = params) do
    Client.get(client, "/email-sources", params)
  end
end
