defmodule Tomba.PhoneTest do
  use ExUnit.Case, async: true

  alias Tomba.Phone

  describe "phone_finder/2" do
    test "requires email key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Phone.phone_finder(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Phone.phone_finder/2)
    end
  end

  describe "phone_validator/2" do
    test "requires phone key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Phone.phone_validator(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Phone.phone_validator/2)
    end
  end
end
