###############################
# Ex 1
###############################
defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

IO.puts(Utility.type("foo"))
IO.puts(Utility.type(123))

###############################
# Ex 2
###############################
defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end

###############################
# Ex 3 - Deriving / Any
###############################
defimpl Size, for: Any do
  def size(_), do: 0
end

defmodule OtherUser do
  # @derive gets the impl defined for Any
  # can also use `@fallback_to_any true`, which will do so if impl not found for type
  @derive [Size]
  defstruct [:name, :age]
end

IO.puts(1 + 2)
