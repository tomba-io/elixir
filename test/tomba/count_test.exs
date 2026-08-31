defmodule Tomba.CountTest do
  use ExUnit.Case, async: true

  alias Tomba.Count

  describe "email_count/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Count.email_count(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Count.email_count/2)
    end
  end
end
