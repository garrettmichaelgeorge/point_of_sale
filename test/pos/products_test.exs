defmodule POS.ProductsTest do
  use ExUnit.Case, async: true

  alias POS.Products
  alias POS.Product
  alias POS.Barcode

  describe "looking up a product by barcode" do
    test "success: returns the product" do
      barcode = Barcode.new("123")
      assert %Product{} = product = Products.get_product_by_barcode(barcode)
      assert ^barcode = product.barcode
    end
  end
end
