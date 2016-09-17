defmodule V21 do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(V21.Repo, []),
      # Start the endpoint when the application starts
      supervisor(V21.Endpoint, []),
      # Start your own worker by calling: V21.Worker.start_link(arg1, arg2, arg3)
      # worker(V21.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: V21.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    V21.Endpoint.config_change(changed, removed)
    :ok
  end
end
