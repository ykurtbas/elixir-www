defmodule WWWServerTest do
  use ExUnit.Case
  alias WWW.{Room, Player}
  # doctest WWW

  test "runs the server" do
    WWWServer.start_link()

    {:ok, player1} = Player.new("1", "Player 1")
    {:ok, player2} = Player.new("2", "Player 2")

    {:ok, room} = Room.new("id", "name", false)
    {:ok, p1room} = Room.join(room, player1)
    {:ok, p2room} = Room.join(p1room, player2)

    WWWServer.add_room(room)
    WWWServer.add_room(p1room)
    WWWServer.add_room(p2room)
    # IO.inspect(:sys.get_state(WWWServer.service_name))

    {:ok, new_room} = Room.new("new-id", "new name", false)
    WWWServer.add_room(new_room)

    assert length(:sys.get_state(WWWServer.service_name).rooms) == 4
  end
end
