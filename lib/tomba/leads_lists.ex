defmodule Tomba.LeadsLists do
  @moduledoc """
  Leads Lists API for Tomba.

  Manage leads lists in your Tomba CRM.

  See [Leads Lists API](https://docs.tomba.io/api/leads-lists) for details.
  """

  alias Tomba.Client

  @doc """
  Get all leads lists.

  See [Get Leads Lists](https://docs.tomba.io/api/leads-lists#get-leads-lists).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.LeadsLists.list(client)
      {:ok, %{"data" => [%{"id" => "...", "name" => "My List", ...}]}}

  """
  @spec list(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list(%Client{} = client) do
    Client.get(client, "/leads_lists")
  end

  @doc """
  Get a leads list by ID.

  See [Leads Lists API](https://docs.tomba.io/api/leads-lists).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The leads list ID.

  ## Examples

      iex> Tomba.LeadsLists.get(client, "123")
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec get(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get(%Client{} = client, id) do
    Client.get(client, "/leads_lists/#{id}")
  end

  @doc """
  Create a new leads list.

  See [Create List](https://docs.tomba.io/api/lead-lists#create-leads-list).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `params` - A map with list data (e.g., `%{"name" => "My List"}`).

  ## Examples

      iex> Tomba.LeadsLists.create(client, %{"name" => "My List"})
      {:ok, %{"data" => %{"id" => "...", ...}}}

  """
  @spec create(Client.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create(%Client{} = client, params) do
    Client.post(client, "/leads_lists", params)
  end

  @doc """
  Update a leads list by ID.

  See [Update List](https://docs.tomba.io/api/lead-lists#update-leads-list).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The leads list ID.
    * `params` - A map with data to update.

  ## Examples

      iex> Tomba.LeadsLists.update(client, "123", %{"name" => "Updated List"})
      {:ok, %{"data" => %{"id" => "123", ...}}}

  """
  @spec update(Client.t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def update(%Client{} = client, id, params) do
    Client.put(client, "/leads_lists/#{id}", params)
  end

  @doc """
  Delete a leads list by ID.

  See [Delete List](https://docs.tomba.io/api/lead-lists#delete-leads-list).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The leads list ID to delete.

  ## Examples

      iex> Tomba.LeadsLists.delete(client, "123")
      {:ok, %{}}

  """
  @spec delete(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete(%Client{} = client, id) do
    Client.delete(client, "/leads_lists/#{id}")
  end
end
