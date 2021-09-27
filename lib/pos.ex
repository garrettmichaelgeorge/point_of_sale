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
    barcode = Barcode.new(barcode_string)
    product = product_lookup_fn.(barcode)
    message = product.price

    result = display_fn.(message, [])
    {:ok, result}
  end
end
