defmodule Kumbuka.Server do
  use GenServer

  alias Kumbuka.Eraser

  def init({text, steps}) do
    {:ok, Eraser.new(text, steps)}
  end

  def handle_call(:erase, _from, text_and_step) do
    {:reply, Eraser.erase(text_and_step), Eraser.erase(text_and_ste)}
  end
end
