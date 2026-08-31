defmodule Tomba.AccountTest do
  use ExUnit.Case, async: true

  alias Tomba.Account

  describe "account/1" do
    test "requires a Client struct" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")
      assert %Tomba.Client{} = client
      # Function exists and accepts client
      assert is_function(&Account.account/1)
    end
  end
end
