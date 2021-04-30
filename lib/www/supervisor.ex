defmodule WWW.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {WWW.HallServer, name: WWW.HallServer},
      {Registry, [name: WWW.RoomRegistry, keys: :unique, members: :auto]},
      {DynamicSupervisor, name: WWW.RoomSupervisor, strategy: :one_for_one, shutdown: 1000, members: :auto}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
