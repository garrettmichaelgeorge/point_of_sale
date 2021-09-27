defmodule POS.ProductsLookupBehaviour do
  alias POS.Product
  alias POS.Barcode

  @callback get_product_by_barcode(Barcode.t()) :: Product.t()
end
