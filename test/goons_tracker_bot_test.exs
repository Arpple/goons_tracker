defmodule GoonsTrackerBotTest do
  use ExUnit.Case
  doctest GoonsTrackerBot

  test "greets the world" do
    assert GoonsTrackerBot.hello() == :world
  end
end
