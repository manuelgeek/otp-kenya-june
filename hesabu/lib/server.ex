defmodule Hesabu.Server do
  use GenServer

  alias Hesabu.Core

  def start_link(initial_count) do
    GenServer.start_link(__MODULE__, initial_count, name: __MODULE__)
  end

  def init(count) do
    IO.puts("starting.........")
    {:ok, count}
  end

  def handle_cast(:inc, count) do
    {:noreply, Core.inc(count)}
  end

  def handle_cast(:dec, count) do
    {:noreply, Core.dec(count)}
  end

  def handle_call(:count, _from, count) do
    {:reply, count, count}
  end
end
