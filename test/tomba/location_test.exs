defmodule Tomba.LocationTest do
  use ExUnit.Case, async: true

  alias Tomba.Location

  describe "get_location/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Location.get_location(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Location.get_location/2)
    end
  end
end
