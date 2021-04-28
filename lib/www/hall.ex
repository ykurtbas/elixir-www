defmodule WWW.Hall do
  alias WWW.Room
  alias __MODULE__

  defstruct [:rooms]

  @opaque t :: %Hall{
    rooms: [Room.t]
  }

  @spec new :: t
  def new do
    %Hall{rooms: []}
  end

  @spec add_room(t, Room.t) :: t
  def add_room(hall, room) do
    %Hall{hall | rooms: [room | hall.rooms]}
  end
end
