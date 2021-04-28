defmodule WWW.RoomServer do
  use GenServer

  # Server
  @impl true

  def init(_) do
    {:ok, 1}
  end

  # Client
  def start_link(opts) do
    GenServer.start_link(
      __MODULE__,
      opts
    )
  end
end
