defmodule Math do
  # public
  def sum(a, b) do
    a + b
  end

  # private
  defp do_sum(a, b) do
    a + b
  end

  # BEGIN guard/clauses
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end

  # can also be defined as:
  #
  #   def zero?(0), do: true
  #   def zero?(x) when is_integer(x), do: false
  #
  # END guard/clauses
end

defmodule Concat do
  # has a default argument 'sep'. Default expression is evaluated at RUNTIME,
  # EACH TIME
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end

  # BEGIN clauses + default arguement
  # this function has multiple clauses, if it also has multiple cases AND we
  # want default values for arguments, we must declare a function HEAD

  def join2(a, b \\ nil, sep \\ " ") # <-- HEAD

  def join2(a, b, _sep) when is_nil(b) do
    a
  end

  def join2(a, b, sep) do
    a <> sep <> b
  end
  # END clauses + default arguement
end

defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts msg
    print_multiple_times msg, n-1
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end

  # BEGIN reduce
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
  # END reduce

  # BEGIN map
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
  # END map
end

IO.puts Concat.join("Hello", "world")
IO.puts Concat.join("Hello", "world", "-")

IO.puts Math.sum(1, 2)                      # --> 3
# IO.puts Math.do_sum(1, 2)                   <-- throws error

IO.puts Math.zero?(0)                       # --> true
IO.puts Math.zero?(1)                       # --> false
# IO.puts Math.zero?([1, 2, 3])               <-- throws FunctionClauseError
# IO.puts Math.zero?(0.0)                     <-- throws FunctionClauseError

# BEGIN capturing functions
fun = &Math.zero?/1 # use '&' to reference names functions
IO.puts is_function(1)
IO.puts fun.(0)
# these two functions are equivalent
fun1 = &(&1 + 1)
fun2 = fn first_arg -> first_arg + 1 end
# END capturing functions

# BEGIN default arguments and clauses
IO.puts Concat.join2("Hello", "world")      # --> Hello world
IO.puts Concat.join2("Hello", "world", "_") # --> Hello_world
IO.puts Concat.join2("Hello")               # --> Hello
# END default arguments and clauses

# BEGIN recursion
Recursion.print_multiple_times("Hello!", 3) # --> Hello!\n (x3)
IO.puts Recursion.sum_list [1, 2, 3], 0     # --> 6
IO.puts inspect(
  Recursion.double_each([1, 2, 3]))         # --> [2, 4, 6]

IO.puts Enum.reduce(
  [1, 2, 3], 0, &+/2
)                                           # --> 6
IO.puts inspect(Enum.map(
  [1, 2, 3], &(&1 * 2)
))                                          # --> [2, 4, 6]

# END recursion
