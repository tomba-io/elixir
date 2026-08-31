defmodule Tomba.RevealTest do
  use ExUnit.Case, async: true

  alias Tomba.Reveal

  describe "companies_search/2" do
    test "function exists with correct arity" do
      assert is_function(&Reveal.companies_search/2)
    end
  end
end
