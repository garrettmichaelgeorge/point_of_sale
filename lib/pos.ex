defmodule POS do
  def handle_barcode(barcode_string) when is_binary(barcode_string) do
    true
  end
end
