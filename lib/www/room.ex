defmodule WWW.Room do
  alias __MODULE__

  defstruct [:id, :name, :is_private?, :players]

  @opaque t :: %Room{
    id: String.t,
    name: String.t,
    is_private?: boolean(),
    players: [Player.t]
  }

  # TODO: Add guards

  @spec new(String.t, String.t, boolean()) :: {:ok, t}
  def new(id, name, is_private) do
    {:ok, %Room{id: id, name: name, is_private?: is_private, players: []}}
  end

  # TODO: Add is max player check guards?
  # TODO: Add is active round check, guard?
  # TODO: Maybe receive max player count from configuration, rather than @attribute?

  @spec join(t, Player.t) :: {:ok, t}
  def join(room, player) do
    {:ok, %Room{room | players: [player | room.players]}}
  end
end
