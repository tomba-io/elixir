defmodule Tomba.Format do
  @moduledoc """
  Email Format API for Tomba.

  Get the email format used by a given domain.

  See [Email Format API](https://docs.tomba.io/api/finder#email-format) for details.
  """

  alias Tomba.Client

  @doc """
  Get the email format used by a domain.

  See [Email Format](https://docs.tomba.io/api/finder#email-format#email-format).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to find the email format for.

  ## Examples

      iex> Tomba.Format.email_format(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => %{"format" => "{first}.{last}", ...}}}

  """
  @spec email_format(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_format(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/email-format", params)
  end
end
