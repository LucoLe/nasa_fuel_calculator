defmodule NasaFuelCalculator.CliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias NasaFuelCalculator.CLI

  describe "main" do
    test "waits for a proper weight of equipment input" do
      assert capture_io(
               [input: "a\n500\na\n[{:launch, 5.0}, {:land, 4.0}]", capture_prompt: false],
               fn ->
                 CLI.main(nil)
               end
             ) ==
               """
               The weight of the equipment must be an integer!
               The path must be in the form '[{:launch | :land, float}]'!
               101
               """
    end
  end
end
