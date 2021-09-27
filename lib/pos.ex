defmodule POS do
  alias POS.Products
  alias POS.CrystalfontzClient
  alias POS.Barcode

  def handle_barcode(
        barcode_string,
        product_lookup_fn \\ &Products.get_product_by_barcode/1,
        display_fn \\ &CrystalfontzClient.display_message/2
      )
      when is_binary(barcode_string) do
    message = "hello!"
    barcode = Barcode.new("123")

    product_lookup_fn.(barcode)

    display_fn.(message, [])

    true
  end
end
