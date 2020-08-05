defmodule Kumbuka.Server do
  alias Kumbuka.Eraser
  use GenServer

  def start_link(text, steps) do
    GenServer.start_link(__MODULE__, Eraser.new(text, steps))
  end

  def stop(pid), do: GenServer.cast(pid, :stop)

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def erase(pid) do
    GenServer.call(pid, :erase)
  end

  def flush(name) do
    GenServer.cast(name, :flush)
  end

  def init(args) do
    {:ok, args}
  end

  def handle_cast(:stop, state), do: {:stop, :normal, state}

  def handle_cast(:flush, _state) do
    {:noreply, %{}}
  end

  def handle_call(:erase, _from, state) do
    reduced = Eraser.eraser(state)
    {:reply, reduced.text, reduced}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
end
