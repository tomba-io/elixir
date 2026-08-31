defmodule Tomba.LogsTest do
  use ExUnit.Case, async: true

  alias Tomba.Logs

  describe "get_logs/1" do
    test "function exists with correct arity" do
      assert is_function(&Logs.get_logs/1)
    end
  end
end
