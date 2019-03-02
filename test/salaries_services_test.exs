defmodule SalariesServicesTest do
  use ExUnit.Case
  doctest PayrollServices

  alias PayrollServices.SalariesServices

  test "calculate reference tax" do
  	assert SalariesServices.calculate_tax(60050) == 922
  end 	

  test "check for no tax" do
  	assert SalariesServices.calculate_tax(12345) == 0
  end

  test "calculate tax bracket 1" do
  	assert SalariesServices.calculate_tax(22500) == 68
  end	

  test "calculate tax bracket 2" do
  	assert SalariesServices.calculate_tax(80000) == 1462
  end	

  test "calculate tax bracket 3" do
  	assert SalariesServices.calculate_tax(165000) == 4083
  end	

  test "calculate tax bracket 4" do
  	assert SalariesServices.calculate_tax(250000) == 7171
  end	

  test "calculate tax bracket 4 with float in" do
  	assert SalariesServices.calculate_tax(250000.0) == 7171
  end

  test "calculate tax from annual salary" do
  	assert SalariesServices.calculate_tax(335577) == 10380
  end 	

end