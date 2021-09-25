defmodule POS.BarcodeTest do
  use ExUnit.Case, async: true

  alias POS.Barcode

  test "has a value" do
    assert %Barcode{value: "123"}
  end
end
