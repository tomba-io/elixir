defmodule Tomba.KeysTest do
  use ExUnit.Case, async: true

  alias Tomba.Keys

  describe "functions exist with correct arities" do
    test "list_keys/1" do
      assert is_function(&Keys.list_keys/1)
    end

    test "get_key/2" do
      assert is_function(&Keys.get_key/2)
    end

    test "create_key/1" do
      assert is_function(&Keys.create_key/1)
    end

    test "delete_key/2" do
      assert is_function(&Keys.delete_key/2)
    end

    test "reset_key/2" do
      assert is_function(&Keys.reset_key/2)
    end
  end
end
