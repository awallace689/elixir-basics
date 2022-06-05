# Structs take the name of the module they're defined in.
defmodule User do
  # defines struct fields and default values
  @enforce_keys [:name] # comp-time guarantee only
  defstruct name: "John", age: 27
end

defmodule User2 do
  defstruct [:email, name: "John", age: 27]
end
