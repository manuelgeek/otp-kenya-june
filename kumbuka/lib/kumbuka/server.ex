defmodule Kumbuka.Server do
  alias Kumbuka.Eraser
  use GenServer

  def init({text, steps}) do
    {:ok, Eraser.new(text, steps)}
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
