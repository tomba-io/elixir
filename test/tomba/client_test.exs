defmodule Tomba.ClientTest do
  use ExUnit.Case, async: true

  alias Tomba.Client

  @key System.get_env("TOMBA_API_KEY") || "ta_placeholder_key_for_unit_testing_only_x"
  @secret System.get_env("TOMBA_SECRET_KEY") || "ts_placeholder-0000-0000-0000-0000000000"

  describe "new/3" do
    test "creates a client struct with defaults" do
      client = Client.new(@key, @secret)
      assert %Client{} = client
      assert client.key == @key
      assert client.secret == @secret
      assert client.base_url == "https://api.tomba.io/v1"
      assert client.timeout == 120_000
    end

    test "creates a client struct with custom base_url" do
      client = Client.new(@key, @secret, base_url: "https://custom.api.com/v1")
      assert client.base_url == "https://custom.api.com/v1"
    end

    test "creates a client struct with custom timeout" do
      client = Client.new(@key, @secret, timeout: 60_000)
      assert client.timeout == 60_000
    end
  end
end
