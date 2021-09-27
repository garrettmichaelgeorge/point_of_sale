defmodule POSTest do
  use ExUnit.Case
  doctest POS

  # TODO: make a test list!
  test "handles incoming strings" do
    barcode_string = "123"
    assert POS.handle_barcode(barcode_string)
  end

  test "rejects non-string inputs" do
    invalid_input = 123
    assert_raise FunctionClauseError, fn -> POS.handle_barcode(invalid_input) end
  end

  describe "handling a barcode" do
    test "on successful product lookup, sends product data to display" do
      barcode_string = "123"
      assert POS.handle_barcode(barcode_string)
    end
  end
end
