defmodule HesabuTest do
  use ExUnit.Case
  import Hesabu.Core

  test "one step forward and two steps back" do
    new()
    |> inc
    |> assert_value(1)
    |> inc
    |> assert_value(2)
    |> dec
    |> assert_value(1)
  end
  
  defp assert_value(actual, expected) do
    assert actual == expected
    actual
  end
end
