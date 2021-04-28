defmodule WwwServer do
  alias Www.Hall
  use GenServer

  @service_name :testing

  # Server
  @impl true
  def init(hall) do
    {:ok, hall}
  end

  @impl true
  def handle_call({:add_room, room}, _from, state) do
    # temp for inspection, move down for one-line
    state = state |> Hall.add_room(room)
    IO.inspect(state)
    {:reply, :ok, state}
  end

  # Client
  def start_link() do
    GenServer.start_link(
      __MODULE__,
      %Hall{},
      name: @service_name
    )
  end

  # Api
  @spec add_room(any) :: :ok
  def add_room(room) do
    GenServer.call(@service_name, {:add_room, room})
  end
end
