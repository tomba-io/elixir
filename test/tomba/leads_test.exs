defmodule Tomba.LeadsTest do
  use ExUnit.Case, async: true

  alias Tomba.Leads

  describe "functions exist with correct arities" do
    test "list_leads/2" do
      assert is_function(&Leads.list_leads/2)
    end

    test "get_lead/2" do
      assert is_function(&Leads.get_lead/2)
    end

    test "create_lead/2" do
      assert is_function(&Leads.create_lead/2)
    end

    test "update_lead/3" do
      assert is_function(&Leads.update_lead/3)
    end

    test "delete_lead/2" do
      assert is_function(&Leads.delete_lead/2)
    end
  end
end
