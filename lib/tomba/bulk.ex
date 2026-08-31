defmodule Tomba.Bulk do
  @moduledoc """
  Bulk Operations API for Tomba.

  Manage bulk operations for domain search, email finder, email verifier, and more.

  See [Bulk API](https://docs.tomba.io/api/bulk) for details.
  """

  alias Tomba.Client

  @valid_bulk_types ~w(search similar company finder enrich linkedin author verifier phone-finder phone-validator)

  @doc """
  Returns the list of valid bulk operation types.
  """
  @spec valid_bulk_types() :: [String.t()]
  def valid_bulk_types, do: @valid_bulk_types

  @doc """
  List all bulk operations of a given type.

  See [List Bulks](https://docs.tomba.io/api/bulks).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation (e.g., "search", "finder").
    * `params` - Optional query params (e.g., `%{"page" => 1, "limit" => 10}`).

  ## Valid Bulk Types

  #{Enum.map_join(@valid_bulk_types, "\n", &"    * `\"#{&1}\"`")}

  ## Examples

      iex> Tomba.Bulk.list(client, "search", %{})
      {:ok, %{"data" => [...]}}

  """
  @spec list(Client.t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list(%Client{} = client, bulk_type, params \\ %{}) when bulk_type in @valid_bulk_types do
    Client.get(client, "/bulk/#{bulk_type}", params)
  end

  @doc """
  Get a specific bulk operation by type and ID.

  See [Get Bulk](https://docs.tomba.io/api/bulk#get-bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation.

  ## Examples

      iex> Tomba.Bulk.get(client, "search", "abc123")
      {:ok, %{"data" => %{"id" => "abc123", ...}}}

  """
  @spec get(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.get(client, "/bulk/#{bulk_type}/#{bulk_id}")
  end

  @doc """
  Create a new bulk operation.

  See [Create Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `params` - A map with bulk operation data.

  ## Examples

      iex> Tomba.Bulk.create(client, "search", %{"domains" => ["tomba.io"]})
      {:ok, %{"data" => %{"id" => "...", ...}}}

  """
  @spec create(Client.t(), String.t(), map()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create(%Client{} = client, bulk_type, params) when bulk_type in @valid_bulk_types do
    Client.post(client, "/bulk/#{bulk_type}", params)
  end

  @doc """
  Launch a bulk operation.

  See [Launch Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation to launch.

  ## Examples

      iex> Tomba.Bulk.launch(client, "search", "abc123")
      {:ok, %{}}

  """
  @spec launch(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def launch(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.put(client, "/bulk/#{bulk_type}/#{bulk_id}", %{})
  end

  @doc """
  Delete a bulk operation.

  See [Delete Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation to delete.

  ## Examples

      iex> Tomba.Bulk.delete(client, "search", "abc123")
      {:ok, %{}}

  """
  @spec delete(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.delete(client, "/bulk/#{bulk_type}/#{bulk_id}/delete")
  end

  @doc """
  Archive a bulk operation.

  See [Archive Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation to archive.

  ## Examples

      iex> Tomba.Bulk.archive(client, "search", "abc123")
      {:ok, %{}}

  """
  @spec archive(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def archive(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.delete(client, "/bulk/#{bulk_type}/#{bulk_id}/archive")
  end

  @doc """
  Rename a bulk operation.

  See [Rename Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation to rename.
    * `name` - The new name for the bulk operation.

  ## Examples

      iex> Tomba.Bulk.rename(client, "search", "abc123", "My Search")
      {:ok, %{}}

  """
  @spec rename(Client.t(), String.t(), String.t(), String.t()) ::
          {:ok, map()} | {:error, Tomba.Error.t()}
  def rename(%Client{} = client, bulk_type, bulk_id, name) when bulk_type in @valid_bulk_types do
    Client.put(client, "/bulk/#{bulk_type}/#{bulk_id}/rename", %{"name" => name})
  end

  @doc """
  Get the progress of a bulk operation.

  See [Bulk Progress](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation.

  ## Examples

      iex> Tomba.Bulk.progress(client, "search", "abc123")
      {:ok, %{"data" => %{"progress" => 75, ...}}}

  """
  @spec progress(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def progress(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.get(client, "/bulk/#{bulk_type}/#{bulk_id}/progress")
  end

  @doc """
  Download the results of a bulk operation.

  See [Download Bulk](https://docs.tomba.io/api/bulk).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `bulk_type` - The type of bulk operation.
    * `bulk_id` - The ID of the bulk operation to download.

  ## Examples

      iex> Tomba.Bulk.download(client, "search", "abc123")
      {:ok, %{"data" => %{"url" => "...", ...}}}

  """
  @spec download(Client.t(), String.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def download(%Client{} = client, bulk_type, bulk_id) when bulk_type in @valid_bulk_types do
    Client.get(client, "/bulk/#{bulk_type}/#{bulk_id}/download")
  end
end
