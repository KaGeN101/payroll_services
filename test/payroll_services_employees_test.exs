defmodule PayrollServicesEmployeesTest do
  use ExUnit.Case
  doctest PayrollServices

  test "fetch employees" do
    employees = PayrollServices.Employees.list_employees()
    assert Enum.count(employees) >= 5
  end

  test "create employee" do
    #TODO
  end 

  test "search for employee by id" do
  	result = PayrollServices.Employees.search_employees("1")
  	assert Enum.count(result) == 1
  	assert Enum.at(result,0).first_name == "Sybrand"
  end	

  test "search for employee by name" do
  	result = PayrollServices.Employees.search_employees("Sy")
  	assert Enum.count(result) == 1
  	assert Enum.at(result,0).first_name == "Sybrand"
  end

  test "search for employee by last name" do
  	result = PayrollServices.Employees.search_employees("Vil")
  	assert Enum.count(result) == 1
  	assert Enum.at(result,0).first_name == "Sybrand"
  end

  test "search for employee by not found" do
  	result = PayrollServices.Employees.search_employees("999")
  	assert Enum.count(result) == 0
  end
end
