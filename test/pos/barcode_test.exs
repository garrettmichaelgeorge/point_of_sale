defmodule POS.BarcodeTest do
  use ExUnit.Case, async: true

  alias POS.Barcode

  test "has a value" do
    assert %Barcode{value: "123"}
  end

  test "construct a barcode using string" do
    assert Barcode.new("123") == %Barcode{value: "123"}
    assert Barcode.new("456") == %Barcode{value: "456"}
  end
end
