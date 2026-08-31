defmodule Tomba.VerifierTest do
  use ExUnit.Case, async: true

  alias Tomba.Verifier

  describe "email_verifier/2" do
    test "requires email key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Verifier.email_verifier(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Verifier.email_verifier/2)
    end
  end
end
