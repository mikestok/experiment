defmodule ExperimentTest do
  use ExUnit.Case
  doctest Experiment

  test "greets the world" do
    assert Experiment.hello() == :world
  end
end
