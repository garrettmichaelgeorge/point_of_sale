defmodule POS.CrystalfontzClientBehaviour do
  @callback display_message(String.t(), keyword) :: {:ok, term} | {:error, term}
end
