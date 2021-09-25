defmodule POS.Barcode do
  defstruct ~w[value]a

  @type t :: %__MODULE__{
    value: binary()
  }

  def new(value) when is_binary(value) do
    struct!(__MODULE__, value: value)
  end
end
