defmodule Tomba.TechnologyTest do
  use ExUnit.Case, async: true

  alias Tomba.Technology

  describe "list/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Technology.list(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Technology.list/2)
    end
  end
end
