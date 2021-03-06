defmodule POSTest do
  use ExUnit.Case

  import Mox

  alias POS.Product
  alias POS.Barcode

  setup :verify_on_exit!

  test "rejects non-string inputs" do
    invalid_input = 123
    assert_raise FunctionClauseError, fn -> POS.handle_barcode(invalid_input) end
  end

  test "success: looks up product and sends price to display" do
    barcode_string = "456"
    price = "$54.99"

    POS.MockProducts
    |> expect(:get_product_by_barcode, fn %Barcode{value: ^barcode_string} ->
      %Product{price: price}
    end)

    POS.MockCrystalfontzClient
    |> expect(:display_message, fn ^price, _opts ->
      {:ok, ~S"displayed \"#{message}\" successfully!"}
    end)

    assert {:ok, _} =
             POS.handle_barcode(
               barcode_string,
               &POS.MockProducts.get_product_by_barcode/1,
               &POS.MockCrystalfontzClient.display_message/2
             )
  end
end
