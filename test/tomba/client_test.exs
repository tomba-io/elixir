defmodule Tomba.ClientTest do
  use ExUnit.Case, async: true

  alias Tomba.Client

  @key "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
  @secret "ts_00000000-7288-4e78-a52a-6262acd056e9"

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
