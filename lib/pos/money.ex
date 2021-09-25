defmodule POS.Money do
  defstruct ~w[cents_value]a

  @type t :: %__MODULE__{
    cents_value: integer
  }

  def dollars_only(%__MODULE__{} = money) do
    Integer.floor_div(money.cents_value, 100)
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%POS.Money{} = money) do
      cents_string = "#{money.cents_value}"
    end
  end
end
