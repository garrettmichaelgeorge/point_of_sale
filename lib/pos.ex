defmodule POS do
  alias POS.Products
  alias POS.CrystalfontzClient

  def handle_barcode(
        barcode_string,
        product_lookup_fn \\ &Products.get_product_by_barcode/1,
        display_fn \\ &CrystalfontzClient.display_message/2
      )
      when is_binary(barcode_string) do
    display_fn.("hello!", [])

    true
  end
end
