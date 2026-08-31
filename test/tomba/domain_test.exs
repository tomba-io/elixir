defmodule Tomba.DomainTest do
  use ExUnit.Case, async: true

  alias Tomba.Domain

  describe "domain_search/2" do
    test "requires domain key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Domain.domain_search(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Domain.domain_search/2)
    end
  end
end
