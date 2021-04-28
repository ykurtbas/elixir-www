defmodule WwwServer do
  alias Www.Hall
  use GenServer

  @service_name :testing

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
  def start_link() do
    GenServer.start_link(
      __MODULE__,
      Hall.new(),
      name: @service_name
    )
  end

  @spec service_name :: :testing
  def service_name do
    @service_name
  end

  # Api
  @spec add_room(any) :: :ok
  def add_room(room) do
    GenServer.call(@service_name, {:add_room, room})
  end
end
