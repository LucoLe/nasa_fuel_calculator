defmodule NasaFuelCalculatorTest do
  use ExUnit.Case
  doctest NasaFuelCalculator

  test "Landing Apollo 11" do
    weight_of_equipment = 28801
    path = [{:land, 9.807}]

    assert NasaFuelCalculator.weight_of_fuel(weight_of_equipment, path) == 13447
  end

  test "Apollo 11" do
    weight_of_equipment = 28801
    path = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]

    assert NasaFuelCalculator.weight_of_fuel(weight_of_equipment, path) == 51898
  end

  test "Mission on Mars" do
    weight_of_equipment = 14606
    path = [{:launch, 9.807}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]

    assert NasaFuelCalculator.weight_of_fuel(weight_of_equipment, path) == 33388
  end

  test "Passenger ship" do
    weight_of_equipment = 75432

    path = [
      {:launch, 9.807},
      {:land, 1.62},
      {:launch, 1.62},
      {:land, 3.711},
      {:launch, 3.711},
      {:land, 9.807}
    ]

    assert NasaFuelCalculator.weight_of_fuel(weight_of_equipment, path) == 212_161
  end
end
