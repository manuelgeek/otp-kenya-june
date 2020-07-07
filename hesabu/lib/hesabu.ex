defmodule Hesabu do
  @moduledoc """
  Documentation for `Hesabu`.
  """
  alias Hesabu.Server

  def start(initial_count) do
    {:ok, pid} = GenServer.start_link(Server, initial_count)
    pid
  end

  def inc(counter) do
    GenServer.cast(counter, :inc)
  end

  def dec(counter) do
    GenServer.cast(counter, :dec)
  end

  def count(counter) do
    GenServer.call(counter, :count)
  end
end
