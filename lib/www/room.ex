defmodule Www.Room do
  alias __MODULE__
  alias Www.Player

  defstruct [:id, :name, :is_private?, :players]

  @opaque t :: %Room{
    id: binary(),
    name: binary(),
    is_private?: boolean(),
    players: [Player.t]
  }

  # TODO: Add guards

  @spec new(binary(), binary(), boolean()) :: {:ok, Room.t}
  def new(id, name, is_private) do
    {:ok, %Room{id: id, name: name, is_private?: is_private, players: []}}
  end

  # TODO: Add is max player check guards?
  # TODO: Add is active round check, guard?
  # TODO: Maybe receive max player count from configuration, rather than @attribute?

  @spec join(Room.t, Player.t) :: {:ok, Room.t}
  def join(%Room{} = room, %Player{} = player) do
    {:ok, %Room{room | players: [player | room.players]}}
  end
end
