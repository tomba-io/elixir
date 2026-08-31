defmodule Tomba.FinderTest do
  use ExUnit.Case, async: true

  alias Tomba.Finder

  describe "email_finder/2" do
    test "requires domain, first_name, and last_name keys" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Finder.email_finder(client, %{"domain" => "test.com"})
      end

      assert_raise FunctionClauseError, fn ->
        Finder.email_finder(client, %{"domain" => "test.com", "first_name" => "John"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Finder.email_finder/2)
    end
  end

  describe "author_finder/2" do
    test "requires url key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Finder.author_finder(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Finder.author_finder/2)
    end
  end

  describe "linkedin_finder/2" do
    test "requires url key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Finder.linkedin_finder(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Finder.linkedin_finder/2)
    end
  end

  describe "email_enrichment/2" do
    test "requires email key in params" do
      client = Tomba.client("ta_xxxx", "ts_xxxx")

      assert_raise FunctionClauseError, fn ->
        Finder.email_enrichment(client, %{"invalid" => "param"})
      end
    end

    test "function exists with correct arity" do
      assert is_function(&Finder.email_enrichment/2)
    end
  end
end
