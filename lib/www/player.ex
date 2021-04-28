defmodule Www.Player do
  alias __MODULE__

  defstruct [:id, :name]

  @opaque t :: %Player{
    id: binary(),
    name: binary()
  }

  def new(id, name)
  when is_nil(id)
  when is_nil(name)
  when id == ""
  when name == "",
   do: {:error, "id or name cannot be empty"}

  @spec new(String.t, String.t) :: {:error, String.t} | {:ok, t}
  def new(id, name) do
    case String.length(name) < 20 do
      true -> {:ok, %Player{id: id, name: name}}
      false -> {:error, "player name is longer than 20 characters"}
    end
  end
end
