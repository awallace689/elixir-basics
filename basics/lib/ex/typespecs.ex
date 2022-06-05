# define a custom type
defmodule Person do
  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @type person :: %{
          name: String.t(),
          birth_year: year
        }

  @doc """
  Returns age of person based off year only.
  """
  @spec current_age(person, year) :: integer
  def current_age(person, current_year), do: person.birth_year - current_year
enkd
