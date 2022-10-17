defmodule NasaFuelCalculator.CLI do
  @moduledoc """
  Handle the input parsing and the dispatch to the appropriate functions.
  """

  @doc """
  The entry point for an escript that will accept user input and return the result of the fuel calculation.
  """
  def main(_) do
    weight_of_equipment = get_weight_of_equipment()
    path = get_path()

    NasaFuelCalculator.weight_of_fuel(weight_of_equipment, path)
    |> IO.puts()
  end

  defp get_weight_of_equipment() do
    with weight_of_equipment <- IO.gets("Type the weight of the equipment: "),
         {weight_of_equipment, _} <- Integer.parse(weight_of_equipment) do
      weight_of_equipment
    else
      _ ->
        IO.puts("The weight of the equipment must be an integer!")
        get_weight_of_equipment()
    end
  end

  defp get_path() do
    with path <- IO.gets("Type the path: "),
         true <- Regex.match?(~r/\[({:(launch|land), ([0-9]+\.[0-9]+)}(, )?)+\]/, path),
         parsed_path <-
           Regex.scan(~r/{:(launch|land), ([0-9]+\.[0-9]+)}/, path, capture: :all_but_first) do
      Enum.map(parsed_path, fn [action, gravity] ->
        {String.to_atom(action), String.to_float(gravity)}
      end)
    else
      _ ->
        IO.puts("The path must be in the form '[{:launch | :land, float}]'!")
        get_path()
    end
  end
end
