defmodule DebuggerTestTest do
  use ExUnit.Case
  doctest DebuggerTest

  test "greets the world" do
    assert DebuggerTest.hello() == :world
  end
end
