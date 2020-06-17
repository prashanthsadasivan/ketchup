defmodule Ketchup.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    :ok = :riak_core.register([{:vnode_module, Ketchup.Vnode}])
    :ok = :riak_core_node_watcher.service_up(Ketchup.Service, self)
    children = [
      %{id: Ketchup.VnodeMasterWorker, start: {:riak_core_vnode_master, :start_link, [Ketchup.Vnode]} }
      # Starts a worker by calling: Ketchup.Worker.start_link(arg)
      # {Ketchup.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ketchup.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
