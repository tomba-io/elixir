defmodule Tomba.Keys do
  @moduledoc """
  API Keys management for Tomba.

  List, create, delete, and reset API keys.

  See [Keys API](https://docs.tomba.io/api/keys) for details.
  """

  alias Tomba.Client

  @doc """
  Get all API keys.

  See [Get Keys](https://docs.tomba.io/api/keys#get-keys).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.Keys.list_keys(client)
      {:ok, %{"data" => [%{"id" => "...", ...}]}}

  """
  @spec list_keys(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def list_keys(%Client{} = client) do
    Client.get(client, "/keys")
  end

  @doc """
  Get a specific API key by ID.

  See [Keys API](https://docs.tomba.io/api/keys).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The API key ID.

  ## Examples

      iex> Tomba.Keys.get_key(client, "key_id")
      {:ok, %{"data" => %{"id" => "key_id", ...}}}

  """
  @spec get_key(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def get_key(%Client{} = client, id) do
    Client.get(client, "/keys/#{id}")
  end

  @doc """
  Create a new API key.

  See [Create Key](https://docs.tomba.io/api/keys#create-an-api-key).

  ## Parameters

    * `client` - A `Tomba.Client` struct.

  ## Examples

      iex> Tomba.Keys.create_key(client)
      {:ok, %{"data" => %{"id" => "...", "key" => "ta_...", ...}}}

  """
  @spec create_key(Client.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def create_key(%Client{} = client) do
    Client.post(client, "/keys", %{})
  end

  @doc """
  Delete an API key by ID.

  See [Delete Key](https://docs.tomba.io/api/keys#delete-an-api-key).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The API key ID to delete.

  ## Examples

      iex> Tomba.Keys.delete_key(client, "key_id")
      {:ok, %{}}

  """
  @spec delete_key(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def delete_key(%Client{} = client, id) do
    Client.delete(client, "/keys/#{id}")
  end

  @doc """
  Reset an API key by ID.

  See [Reset Key](https://docs.tomba.io/api/keys#reset-an-api-key).

  ## Parameters

    * `client` - A `Tomba.Client` struct.
    * `id` - The API key ID to reset.

  ## Examples

      iex> Tomba.Keys.reset_key(client, "key_id")
      {:ok, %{"data" => %{"key" => "ta_...", ...}}}

  """
  @spec reset_key(Client.t(), String.t()) :: {:ok, map()} | {:error, Tomba.Error.t()}
  def reset_key(%Client{} = client, id) do
    Client.put(client, "/keys/#{id}", %{})
  end
end
