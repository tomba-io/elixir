defmodule Tomba.LeadsAttributesTest do
  use ExUnit.Case, async: true

  alias Tomba.LeadsAttributes

  describe "functions exist with correct arities" do
    test "list/1" do
      assert is_function(&LeadsAttributes.list/1)
    end

    test "get/2" do
      assert is_function(&LeadsAttributes.get/2)
    end

    test "create/2" do
      assert is_function(&LeadsAttributes.create/2)
    end

    test "update/3" do
      assert is_function(&LeadsAttributes.update/3)
    end

    test "delete/2" do
      assert is_function(&LeadsAttributes.delete/2)
    end
  end
end
