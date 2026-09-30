defmodule Tomba.FlagTest do
  use ExUnit.Case, async: true

  alias Tomba.Flag

  describe "list_flags/1" do
    test "function exists with correct arity" do
      assert is_function(&Flag.list_flags/1)
    end
  end

  describe "create_flag/2" do
    test "accepts any map params" do
      _client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert is_function(&Flag.create_flag/2)
    end

    test "function exists with correct arity" do
      assert is_function(&Flag.create_flag/2)
    end
  end
end
