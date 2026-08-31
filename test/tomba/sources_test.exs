defmodule Tomba.SourcesTest do
  use ExUnit.Case, async: true

  alias Tomba.Sources

  describe "email_sources/2" do
    test "requires email key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Sources.email_sources(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Sources.email_sources/2)
    end
  end
end
