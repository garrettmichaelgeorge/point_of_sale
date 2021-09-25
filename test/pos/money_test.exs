defmodule POS.MoneyTest do
  use ExUnit.Case, async: true

  alias POS.Money

  test "has an integer cents value" do
    assert %Money{cents_value: 123}
  end

  test "gets dollars only" do
    money = %Money{cents_value: 123456}
    assert Money.dollars_only(money) == 1234
  end

  test "gets cents only" do
    money = %Money{cents_value: 98765}
    assert Money.cents_only(money) == 65
  end

  # TODO: implement dollars and cents
  # test "format as string" do
  #   money = %Money{cents_value: 9999}
  #   assert to_string(money) == "$99.99"
  # end
end
