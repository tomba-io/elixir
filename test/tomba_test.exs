defmodule TombaTest do
  use ExUnit.Case
  doctest Tomba

  test "test baseUrl" do
    key = "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
    secret = "ts_00000000-7288-4e78-a52a-6262acd056e9"
    conf = Tomba.new(key, secret)
    assert conf.baseUrl == "https://api.tomba.io/v1/"
  end

  test "tomba init" do
    key = "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
    secret = "ts_00000000-7288-4e78-a52a-6262acd056e9"
    conf = Tomba.new(key, secret)
    assert conf.key == key
    assert conf.secret == secret
  end
  test "test Tomba credentials" do
    assert_raise RuntimeError, "Invalid Tomba credentials", fn ->
      conf = Tomba.new("aaaa", "aaaa")
      assert conf.key == "aaaa"
    end
  end
  test "test Domain Exception" do
    assert_raise RuntimeError, "Invalid Domain name", fn ->
      key = "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
      secret = "ts_00000000-7288-4e78-a52a-6262acd056e9"
      conf = Tomba.new(key, secret)
      Tomba.domain_search(conf, "aaaa")
    end
  end
end
