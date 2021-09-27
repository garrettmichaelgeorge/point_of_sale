defmodule POS.Products do
  alias POS.Barcode
  alias POS.Product

  def get_product_by_barcode(%Barcode{} = barcode) do
    %Product{barcode: barcode}
  end
end
