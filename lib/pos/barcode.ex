defmodule POS.Barcode do
  defstruct ~w[value]a

  @type t :: %__MODULE__{
    value: binary()
  }

  def new(value) when is_binary(value) do
    struct!(__MODULE__, value: value)
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%POS.Barcode{} = barcode), do: barcode.value
  end
end
