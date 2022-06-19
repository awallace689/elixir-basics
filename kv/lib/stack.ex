#
# This file contains two example GenServer implementations.
#
defmodule Stack do
  use GenServer

  # Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# :hello
top_of_stack = GenServer.call(pid, :pop)

# push
:ok = GenServer.cast(pid, {:push, :world})

# :world
top_of_stack = GenServer.call(pid, :pop)

IO.puts(top_of_stack)

# wrap the GenServer code required by client in same module as Server impl.
# If it gets too complex, split client code into own module.

defmodule Stack2 do
  use GenServer

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end
