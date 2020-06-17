defmodule KetchupTest do
  use ExUnit.Case
  doctest Ketchup

  test "greets the world" do
    assert Ketchup.hello() == :world
  end
end
