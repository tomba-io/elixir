defmodule Tomba.UsageTest do
  use ExUnit.Case, async: true

  alias Tomba.Usage

  describe "get_usage/1" do
    test "function exists with correct arity" do
      assert is_function(&Usage.get_usage/1)
    end
  end
end
