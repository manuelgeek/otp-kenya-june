defmodule Kumbuka do
  @moduledoc """
  Documentation for `Kumbuka`.
  """
  alias Kumbuka.Server

  def start_link(text, steps) do
    GenServer.start_link(Server, {text, steps})
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
end
