defmodule Tomba.ErrorTest do
  use ExUnit.Case, async: true

  alias Tomba.Error

  describe "message/1" do
    test "returns plain message when status_code is 0" do
      error = %Error{message: "Connection refused", status_code: 0, response: nil}
      assert Exception.message(error) == "Connection refused"
    end

    test "includes status code in message when present" do
      error = %Error{message: "Unauthorized", status_code: 401, response: nil}
      assert Exception.message(error) == "[401] Unauthorized"
    end

    test "is a valid exception" do
      error = %Error{
        message: "Not found",
        status_code: 404,
        response: %{"errors" => %{"message" => "Not found"}}
      }

      assert is_exception(error)
    end
  end
end
