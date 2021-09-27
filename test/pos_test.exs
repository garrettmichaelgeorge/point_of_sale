defmodule POSTest do
  use ExUnit.Case
  doctest POS

  # TODO: make a test list!
  describe "handling a barcode" do
    test "on successful product lookup, sends product data to display" do
      barcode_string = "123"
      assert POS.handle_barcode(barcode_string)
    end
  end
end
