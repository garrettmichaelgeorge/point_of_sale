defmodule POS.Money do
  defstruct ~w[cents_value]a

  @type t :: %__MODULE__{
    cents_value: integer
  }
end
