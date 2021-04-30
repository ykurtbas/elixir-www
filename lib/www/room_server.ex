defmodule WWW.RoomServer do
  alias __MODULE__
  use GenServer

  # Client
  def child_spec(opts) do
    name = Keyword.get(opts, :name, WWW.RoomServer)
    room = Keyword.fetch!(opts, :room)

    %{
      id: "#{RoomServer}_#{name}",
      start: {RoomServer, :start_link, [room, name]},
      shutdown: 10_000,
      restart: :transient
    }
  end

  def start_link(room, name) do
    GenServer.start_link(
      __MODULE__,
      %{room: room},
      name: via_tuple(name)
    )
  end

  # Server
  @impl true
  def init(%{room: room}) do
    {:ok, room}
  end

  # CALLS

  @doc """
  Return the `:via` tuple for referencing and interacting with a specific
  RoomServer.
  """
  def via_tuple(code), do: {:via, Registry, {WWW.RoomRegistry, code}}
end
