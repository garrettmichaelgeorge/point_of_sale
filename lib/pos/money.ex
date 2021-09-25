defmodule POS.Money do
  defstruct ~w[cents_value]a

  @type t :: %__MODULE__{
    cents_value: integer
  }

  def dollars_only(%__MODULE__{} = money) do
    Integer.floor_div(money.cents_value, 100)
  end

  def cents_only(%__MODULE__{} = money) do
    # FIXME: naive and buggy
    reversed_money_digits =
      money.cents_value
      |> Integer.digits()
      |> Enum.reverse()

    hundredths = Enum.at(reversed_money_digits, 0, 0)
    tenths = Enum.at(reversed_money_digits, 1, 0)
    tenths * 10 + hundredths
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%POS.Money{} = money) do
      cents_string = "#{money.cents_value}"
    end
  end
end
