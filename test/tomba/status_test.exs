defmodule Tomba.StatusTest do
  use ExUnit.Case, async: true

  alias Tomba.Status

  describe "domain_status/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Status.domain_status(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Status.domain_status/2)
    end
  end

  describe "domain_suggestions/2" do
    test "requires query key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Status.domain_suggestions(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Status.domain_suggestions/2)
    end
  end
end
