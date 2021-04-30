defmodule WWW.HallServer do
  alias WWW.Hall
  use GenServer

  # Server
  @impl true
  @spec init(any) :: {:ok, any}
  def init(hall) do
    {:ok, hall}
  end

  @impl true
  def handle_call({:add_room, room}, _from, state) do
    {:reply, :ok, state |> Hall.add_room(room)}
  end

  # Client
  def start_link(opts) do
    GenServer.start_link(
      __MODULE__,
      Hall.new(),
      opts
    )
  end


  # Api
  def add_room(room) do
    GenServer.call(__MODULE__, {:add_room, room})
    DynamicSupervisor.start_child(WWW.RoomSupervisor, {WWW.RoomServer, [room: room, name: do_generate_code()]})
  end

  defp do_generate_code() do
    # Generate a single 4 character random code
    range = ?A..?Z

    1..4
    |> Enum.map(fn _ -> [Enum.random(range)] |> List.to_string() end)
    |> Enum.join("")
  end
end
