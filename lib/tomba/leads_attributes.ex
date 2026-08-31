defmodule Tomba.LeadsAttributes do
  @moduledoc """
  Leads Attributes API for Tomba.

  Manage lead attributes in your Tomba CRM.

  See [Leads Attributes API](https://docs.tomba.io/api/leads-attributes) for details.
  """

  alias Tomba.Client

  @doc """
  Get all lead attributes.

  See [Get Lead Attributes](https://docs.tomba.io/api/leads-attributes#get-lead-attributes).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.LeadsAttributes.list(client)
      {:ok, %{"data" => [%{"id" => "...", "name" => "Company Size", ...}]}}

  """
  @spec list(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list(%Client{} = client) do
    Client.get(client, "/leads/attributes")
  end

  @doc """
  Get a lead attribute by ID.

  See [Leads Attributes API](https://docs.tomba.io/api/leads-attributes).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The attribute ID.

  ## Examples

      iex> Tomba.LeadsAttributes.get(client, "123")
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec get(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get(%Client{} = client, id) do
    Client.get(client, "/leads/attributes/#{id}")
  end

  @doc """
  Create a new lead attribute.

  See [Create Lead Attribute](https://docs.tomba.io/api/leads-attributes#create-lead-attribute).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with attribute data.

  ## Examples

      iex> Tomba.LeadsAttributes.create(client, %{"name" => "Company Size"})
      {:ok, %{"data" => %{"id" => "...", ...}}}

  """
  @spec create(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create(%Client{} = client, params) do
    Client.post(client, "/leads/attributes", params)
  end

  @doc """
  Update a lead attribute by ID.

  See [Update Lead Attribute](https://docs.tomba.io/api/leads-attributes#update-lead-attribute).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The attribute ID.
    * `params` - A map with data to update.

  ## Examples

      iex> Tomba.LeadsAttributes.update(client, "123", %{"name" => "Team Size"})
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec update(Client.t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def update(%Client{} = client, id, params) do
    Client.put(client, "/leads/attributes/#{id}", params)
  end

  @doc """
  Delete a lead attribute by ID.

  See [Delete Lead Attribute](https://docs.tomba.io/api/leads-attributes#delete-lead-attribute).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The attribute ID to delete.

  ## Examples

      iex> Tomba.LeadsAttributes.delete(client, "123")
      {:ok, %{}}

  """
  @spec delete(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete(%Client{} = client, id) do
    Client.delete(client, "/leads/attributes/#{id}")
  end
end
