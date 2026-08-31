defmodule Tomba.SimilarTest do
  use ExUnit.Case, async: true

  alias Tomba.Similar

  describe "websites/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Similar.websites(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Similar.websites/2)
    end
  end
end
