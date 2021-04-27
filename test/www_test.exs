defmodule WwwTest do
  use ExUnit.Case
  doctest Www

  test "greets the world" do
    assert Www.hello() == :world
  end
end
