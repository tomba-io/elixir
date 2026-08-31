defmodule TombaTest do
  use ExUnit.Case, async: true

  describe "client/2" do
    test "creates a client with default options" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")
      assert %Tomba.Client{} = client
      assert client.key == "ta_xxxx"
      assert client.secret == "ts_xxxx"
      assert client.base_url == "https://api.tomba.io/v1"
      assert client.timeout == 120_000
    end

    test "creates a client with custom options" do
      client =
        Tomba.client("ta_xxxx", "ts_xxxx", base_url: "https://custom.api.com/v1", timeout: 60_000)

      assert client.base_url == "https://custom.api.com/v1"
      assert client.timeout == 60_000
    end
  end

  describe "default_base_url/0" do
    test "returns the default API base URL" do
      assert Tomba.default_base_url() == "https://api.tomba.io/v1"
    end
  end
end
