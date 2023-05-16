defmodule GoonsTrackerBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GoonsTrackerBot.Consumer,
      # Starts a worker by calling: GoonsTrackerBot.Worker.start_link(arg)
      # {GoonsTrackerBot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoonsTrackerBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
