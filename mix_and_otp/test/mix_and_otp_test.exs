defmodule MixAndOtpTest do
  use ExUnit.Case
  doctest MixAndOtp

  test "greets the world" do
    assert MixAndOtp.hello() == :world
  end
end
