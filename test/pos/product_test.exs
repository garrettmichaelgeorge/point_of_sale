defmodule POS.ProductTest do
  use ExUnit.Case, async: true

  alias POS.Product

  test "has a price and barcode" do
    product = %Product{}
    assert {:ok, _} = Map.fetch(product, :price)
    assert {:ok, _} = Map.fetch(product, :barcode)
  end
end
