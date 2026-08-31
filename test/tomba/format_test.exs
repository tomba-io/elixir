defmodule Tomba.FormatTest do
  use ExUnit.Case, async: true

  alias Tomba.Format

  describe "email_format/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Format.email_format(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Format.email_format/2)
    end
  end
end
