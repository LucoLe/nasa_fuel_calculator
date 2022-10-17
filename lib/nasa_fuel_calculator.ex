defmodule NasaFuelCalculator do
  @moduledoc """
  This module has functions related to calculating the fuel needed for a space flight which consists of multiple
  launches and landings.
  """

  @doc """
  Calculates the fuel needed for for a given path.

  ## Examples

      iex> NasaFuelCalculator.weight_of_fuel(500, [{:launch, 5.0}, {:land, 4.0}])
      101

  """
  @type path() :: [{:launch | :land, float()}]
  @spec weight_of_fuel(integer(), path()) :: integer()
  def weight_of_fuel(weight_of_equipment, path) do
    path
    |> Enum.reverse()
    |> Enum.reduce(weight_of_equipment, &calculate_fuel_weight/2)
    |> Kernel.-(weight_of_equipment)
  end

  defp calculate_fuel_weight(_step, mass) when mass <= 0, do: 0

  defp calculate_fuel_weight({:launch, gravity} = step, mass) do
    fuel = floor(mass * gravity * 0.042 - 33)
    mass + calculate_fuel_weight(step, fuel)
  end

  defp calculate_fuel_weight({:land, gravity} = step, mass) do
    fuel = floor(mass * gravity * 0.033 - 42)
    mass + calculate_fuel_weight(step, fuel)
  end
end
