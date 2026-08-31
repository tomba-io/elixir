defmodule Tomba.Leads do
  @moduledoc """
  Leads API for Tomba.

  Manage leads in your Tomba CRM.

  See [Leads API](https://docs.tomba.io/api/leads) for details.
  """

  alias Tomba.Client

  @doc """
  Get all leads.

  See [List Leads](https://docs.tomba.io/api/leads).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with optional keys:
      * `"page"` (optional) - Page number for pagination.
      * `"limit"` (optional) - Number of results per page.
      * `"domain"` (optional) - Filter leads by domain.

  ## Examples

      iex> Tomba.Leads.list_leads(client, %{})
      {:ok, %{"data" => [%{"email" => "lead@example.com", ...}]}}

  """
  @spec list_leads(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list_leads(%Client{} = client, params \\ %{}) do
    Client.get(client, "/leads", params)
  end

  @doc """
  Get a lead by ID.

  See [Get Lead](https://docs.tomba.io/api/leads#retrieve-a-single-lead).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `lead_id` - The ID of the lead to retrieve.

  ## Examples

      iex> Tomba.Leads.get_lead(client, "123")
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec get_lead(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get_lead(%Client{} = client, lead_id) do
    Client.get(client, "/leads/#{lead_id}")
  end

  @doc """
  Create a new lead.

  See [Create Lead](https://docs.tomba.io/api/leads#create-a-lead).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with lead data (e.g., `%{"email" => "lead@example.com", "first_name" => "John"}`).

  ## Examples

      iex> Tomba.Leads.create_lead(client, %{"email" => "lead@example.com", "first_name" => "John"})
      {:ok, %{"data" => %{"id" => "...", ...}}}

  """
  @spec create_lead(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create_lead(%Client{} = client, params) do
    Client.post(client, "/leads", params)
  end

  @doc """
  Update a lead by ID.

  See [Update Lead](https://docs.tomba.io/api/leads#update-a-lead).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `lead_id` - The ID of the lead to update.
    * `params` - A map with lead data to update.

  ## Examples

      iex> Tomba.Leads.update_lead(client, "123", %{"first_name" => "Jane"})
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec update_lead(Client.t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def update_lead(%Client{} = client, lead_id, params) do
    Client.put(client, "/leads/#{lead_id}", params)
  end

  @doc """
  Delete a lead by ID.

  See [Delete Lead](https://docs.tomba.io/api/leads#delete-a-lead).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `lead_id` - The ID of the lead to delete.

  ## Examples

      iex> Tomba.Leads.delete_lead(client, "123")
      {:ok, %{}}

  """
  @spec delete_lead(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete_lead(%Client{} = client, lead_id) do
    Client.delete(client, "/leads/#{lead_id}")
  end
end
