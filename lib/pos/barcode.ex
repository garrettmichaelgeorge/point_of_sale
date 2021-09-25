defmodule POS.Barcode do
  defstruct ~w[value]a

  @type t :: %__MODULE__{
    value: binary()
  }
end
