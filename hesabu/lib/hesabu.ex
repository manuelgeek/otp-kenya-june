defmodule Hesabu do
  @moduledoc """
  Documentation for `Hesabu`.
  """
  alias Hesabu.Boundary

  def start(initial_count) do
    Boundary.start(initial_count)
  end

  def inc(counter) do
    send(counter, :inc)
  end

  def dec(counter) do
    send(counter, :dec)
  end

  def count(counter) do
    send(counter, {:count, self()})

    receive do
      message ->
        message
    end
  end
end
