defmodule KumbukaTest do
  use ExUnit.Case
  doctest Kumbuka

  test "greets the world" do
    assert Kumbuka.hello() == :world
  end
end
