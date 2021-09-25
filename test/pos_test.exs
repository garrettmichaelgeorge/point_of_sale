defmodule POSTest do
  use ExUnit.Case
  doctest POS

  test "greets the world" do
    assert POS.hello() == :world
  end
end
