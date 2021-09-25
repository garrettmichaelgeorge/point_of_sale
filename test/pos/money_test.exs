defmodule POS.MoneyTest do
  use ExUnit.Case, async: true

  alias POS.Money

  test "has an integer cents value" do
    assert %Money{cents_value: 123}
  end

  test "format as string" do
    money = %Money{cents_value: 9999}
    assert to_string(money)
  end
end
