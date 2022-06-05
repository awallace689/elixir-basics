# Use Task.start/1 Task.start_link/1 instead of spawn/spawn_link for better
# error reporting

# spawn a new process
#   executes given function and then exits
pid = spawn(fn -> 1 + 2 end)
IO.puts(inspect(pid))
IO.puts(Process.alive?(pid))

# get current pid
IO.puts(Process.alive?(self()))

# send messages to a process w/ send/2 and receive with receive/1
send(self(), {:hello, "world"})
# supports guards and clauses
# will hang until message received (blocking)
received_msg =
  receive do
    {:hello, msg} -> msg
  end

IO.puts(received_msg)

# receive/1 with timeout
send(self(), {:goodbye, "bad"})

received_msg =
  receive do
    {:hello, msg} -> msg
  after
    # timeout = 0 means message should already be in mailbox
    1_000 -> "nothing after 1s"
  end

IO.puts(received_msg)

# BEGIN send message to process
parent = self()
spawn(fn -> send(parent, {:hello, self()}) end)

msg =
  receive do
    {:hello, pid} -> "Parent #{inspect(parent)} got #{:hello} from child #{inspect(pid)}"
  end

IO.puts(msg)

# use flush/0 to clean and print all messages in mailbox (in iex only)
# flush() # --> :goodbye

# use spawn_link/1 to spawn a linked process
# isolated process created w/ spawn/1:
# does not halt parent execution
spawn(fn -> raise "oops" end)

# linked process created w/ spawn_link/1
# spawn_link(fn -> raise "oops - halt execution" end) # halts parent execution

IO.puts("still running")
