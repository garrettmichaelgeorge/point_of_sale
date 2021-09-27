defmodule POS.MixProject do
  use Mix.Project

  def project do
    [
      app: :point_of_sale,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {POS.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bypass, "~> 2.1", only: :test},
      {:jason, "~> 1.2"},
      {:mox, "~> 1.0", only: :test}
    ]
  end
end
