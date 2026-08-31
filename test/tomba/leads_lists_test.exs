defmodule Tomba.LeadsListsTest do
  use ExUnit.Case, async: true

  alias Tomba.LeadsLists

  describe "functions exist with correct arities" do
    test "list/1" do
      assert is_function(&LeadsLists.list/1)
    end

    test "get/2" do
      assert is_function(&LeadsLists.get/2)
    end

    test "create/2" do
      assert is_function(&LeadsLists.create/2)
    end

    test "update/3" do
      assert is_function(&LeadsLists.update/3)
    end

    test "delete/2" do
      assert is_function(&LeadsLists.delete/2)
    end
  end
end
