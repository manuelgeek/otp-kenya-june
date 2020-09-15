defmodule Kumbuka.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Kumbuka.Worker.start_link(arg)
      {Kumbuka, {Wanjiku.text(), 4, :wanjiku}},
      {Kumbuka, {Magak.text(), 3, :magak}},
      {Kumbuka, {Frank.text(), 2, :frank}},
      {Kumbuka, {Bruce.text(), 4, :bruce}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kumbuka.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
