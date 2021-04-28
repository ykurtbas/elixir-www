defmodule Www.Hall do
  alias __MODULE__
  alias Www.Room

  defstruct [:rooms]

  @opaque t :: %Hall{
    rooms: [Room.t]
  }

  # TODO: Probably change the rooms to a Map? ask community

  @spec new :: t
  def new do
    %Hall{rooms: []}
  end

  @spec add_room(t, Room.t) :: t
  def add_room(hall, room) do
    %Hall{hall | rooms: [room | hall.rooms]}
  end
end
