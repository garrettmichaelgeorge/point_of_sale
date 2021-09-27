defmodule POS.ProductTest do
  use ExUnit.Case, async: true

  alias POS.Product
  alias POS.Barcode

  test "has a price and barcode" do
    assert product = %Product{price: "$9.99", barcode: Barcode.new("456")}
  end
end
