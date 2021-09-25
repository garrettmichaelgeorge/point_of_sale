defmodule POS.Product do
  alias POS.Barcode

  defstruct ~w[barcode price]a

  @type t :: %__MODULE__{
              barcode: Barcode.t(),
              price: String.t()
            }
end
