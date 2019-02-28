defmodule PayrollServicesTest do
  use ExUnit.Case
  doctest PayrollServices

  test "greets the world" do
    assert PayrollServices.hello() == :world
  end
end
