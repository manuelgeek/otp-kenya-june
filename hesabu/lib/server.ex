defmodule Hesabu.Server do
  use GenServer

  alias Hesabu.Core

  def start_link(initial_count, name) do
    GenServer.start_link(__MODULE__, initial_count, name: name)
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

  def child_spec({value, name}) do
    %{id: name, start: {Hesabu.Server, :start_link, [value, name]}}
  end
end
