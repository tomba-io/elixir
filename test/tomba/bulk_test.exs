defmodule Tomba.BulkTest do
  use ExUnit.Case, async: true

  alias Tomba.Bulk

  describe "valid_bulk_types/0" do
    test "returns a list of valid bulk types" do
      types = Bulk.valid_bulk_types()
      assert is_list(types)
      assert "search" in types
      assert "similar" in types
      assert "company" in types
      assert "finder" in types
      assert "enrich" in types
      assert "linkedin" in types
      assert "author" in types
      assert "verifier" in types
      assert "phone-finder" in types
      assert "phone-validator" in types
    end
  end

  describe "list/3" do
    test "rejects invalid bulk types with guard clause" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.list(client, "invalid-type", %{})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Bulk.list/3)
    end
  end

  describe "get/3" do
    test "rejects invalid bulk types" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.get(client, "invalid-type", "id123")
      end
    end
  end

  describe "create/3" do
    test "rejects invalid bulk types" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.create(client, "invalid-type", %{})
      end
    end
  end

  describe "launch/3" do
    test "rejects invalid bulk types" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.launch(client, "invalid-type", "id123")
      end
    end
  end

  describe "delete/3" do
    test "rejects invalid bulk types" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.delete(client, "invalid-type", "id123")
      end
    end
  end

  describe "rename/4" do
    test "rejects invalid bulk types" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Bulk.rename(client, "invalid-type", "id123", "New Name")
      end
    end
  end
end
