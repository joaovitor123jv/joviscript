defmodule JoviscriptTest do
  use ExUnit.Case
  doctest Joviscript

  test "greets the world" do
    assert Joviscript.hello() == :world
  end
end
