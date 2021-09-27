defmodule POSTest do
  use ExUnit.Case

  import Mox

  alias POS.Product

  setup :verify_on_exit!

  # TODO: make a test list!
  test "handles incoming strings" do
    barcode_string = "123"
    assert POS.handle_barcode(barcode_string)
  end

  test "rejects non-string inputs" do
    invalid_input = 123
    assert_raise FunctionClauseError, fn -> POS.handle_barcode(invalid_input) end
  end

  test "on successful product lookup, sends product data to display" do
    price = "$54.99"

    POS.MockProducts
    |> expect(:get_product_by_barcode, fn _barcode -> %Product{price: price} end)

    POS.MockCrystalfontzClient
    |> expect(:display_message, fn _message, _opts ->
      {:ok, ~S"displayed \"#{message}\" successfully!"}
    end)

    barcode_string = "123"

    assert POS.handle_barcode(
             barcode_string,
             &POS.MockProducts.get_product_by_barcode/1,
             &POS.MockCrystalfontzClient.display_message/2
           )
  end
end
