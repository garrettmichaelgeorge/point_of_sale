defmodule POS.Money do
  defstruct ~w[cents_value]a

  @type t :: %__MODULE__{
    cents_value: integer
  }

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%POS.Money{} = money),
      do: "#{money.cents_value}"
  end
end
