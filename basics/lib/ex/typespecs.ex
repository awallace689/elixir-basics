# define a custom type
defmodule Person do
  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @type person :: %{name: String.t(), birth_year: year}

  @doc """
  Returns age of person based off year only.
  """
  @spec current_age(person, year) :: integer
  def current_age(person, current_year), do: person.birth_year - current_year
end

# Parser interface
defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t()) :: {:ok, term} | {:error, String.t()}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t()]
end

defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  @doc """
  parse JSON
  """
  def parse(str), do: {:ok, "some json" <> str}

  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  @impl Parser
  @doc """
  parse YAML
  """
  def parse(str), do: {:ok, "some yaml" <> str}

  @impl Parser
  def extensions, do: ["yml"]
end
