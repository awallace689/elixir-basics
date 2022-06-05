# define a custom type
defmodule Person do
  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @spec current_age(year) :: integer
  def current_age(year_of_birth), do: year_of_birth
end

IO.puts(Person.current_age("hello"))
