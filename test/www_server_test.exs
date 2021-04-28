defmodule WwwServerTest do
  use ExUnit.Case
  alias Www.{Room, Player}
  # doctest Www

  test "runs the server" do
    WwwServer.start_link()

    {:ok, player1} = Player.new("1", "Player 1")
    {:ok, player2} = Player.new("2", "Player 2")

    {:ok, room} = Room.new("id", "name", false)
    {:ok, p1room} = Room.join(room, player1)
    {:ok, p2room} = Room.join(p1room, player2)

    WwwServer.add_room(p2room)

    {:ok, new_room} = Room.new("new-id", "new name", false)
    WwwServer.add_room(new_room)

    # assert Www.hello() == :world
  end
end
