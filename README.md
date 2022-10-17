# NasaFuelCalculator

## Description

An application that will calculate the fuel required for a space flight. It expects an input of the weight of the
equipment and the mission path. The mission path should be an array of tuples. Each step of the mission path should be
in the form `{:launch | :land, float}`.The calculation is done according to the following two formulas:

- For launch - `mass * gravity * 0.042 - 33` rounded down
- For landing - `mass * gravity * 0.033 - 42` rounded down

When calculating the fuel consumption the fuel will require additional fuel so this should be taken into account.

## Running the application

There are two ways to run the application you can call directly the `NasaFuelCalculator.weight_of_fuel/2` function or
use the precompiled escript by issuing `./nasa_fuel_calculator` from the command line.

## Updating the escript

In order to update the escript with the latest changes in the code you'll need to run `mix escript.build` from the
command line.

## Documentation

The application has documentation generated with `ex_doc` which you can browse locally. The documentation is not stored
under version control so you'll have to generate it locally first with `mix docs`. After that you can open
`doc/index.html` in your browser.
