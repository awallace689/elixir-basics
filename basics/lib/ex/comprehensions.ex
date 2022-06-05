defmodule MyIO do
  def putspect(data) do
    IO.puts(inspect(data))
  end
end

MyIO.putspect(for n <- [1, 2, 3, 4], do: n * n)

# pattern matching
values = [good: 1, good: 2, bad: 3, good: 4]
MyIO.putspect(for {:good, n} <- values, do: 1)

# or guard on the result
for n <- 0..5, rem(n, 3) == 0, do: n * n

# bitstring generators
nums = <<213, 45, 132, 64>>
for <<fst::8, snd::8, trd::8 <- nums>> do
  {fst, snd, trd} |> MyIO.putspect
end

# :into can insert expression's value into a structure with the Collectable protocol
for x <- String.split("123"), into: [], do: x
