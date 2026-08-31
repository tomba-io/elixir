defmodule Tomba.Count do
  @moduledoc """
  Email Count API for Tomba.

  Returns the total number of email addresses found for a given domain.

  See [Email Count API](https://docs.tomba.io/api/finder#email-count) for details.
  """

  alias Tomba.Client

  @doc """
  Get the number of email addresses found for a domain.

  See [Email Count](https://docs.tomba.io/api/finder#email-count#email-count).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with the following keys:
      * `"domain"` (required) - The domain name to count emails for (e.g., "tomba.io").

  ## Examples

      iex> Tomba.Count.email_count(client, %{"domain" => "tomba.io"})
      {:ok, %{"data" => %{"total" => 42, ...}}}

  """
  @spec email_count(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def email_count(%Client{} = client, %{"domain" => _} = params) do
    Client.get(client, "/email-count", params)
  end
end
