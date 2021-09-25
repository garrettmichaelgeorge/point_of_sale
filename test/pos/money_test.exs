defmodule POS.MoneyTest do
  use ExUnit.Case, async: true

  alias POS.Money

  test "has an integer cents value" do
    assert %Money{cents_value: 123}
  end
end
