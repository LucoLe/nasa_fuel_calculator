defmodule NasaFuelCalculator.MixProject do
  use Mix.Project

  def project do
    [
      app: :nasa_fuel_calculator,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Nasa Fuel Calculator",
      source_url: "https://github.com/LucoLe/nasa_fuel_calculator"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.28.6"}
    ]
  end

  defp escript_config do
    [
      main_module: NasaFuelCalculator.CLI
    ]
  end
end
