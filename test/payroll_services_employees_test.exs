defmodule PayrollServicesEmployeesTest do
  use ExUnit.Case
  doctest PayrollServices

  test "fetch employees" do
    employees = PayrollServices.Employees.list_employees()
    assert Enum.count(employees) >= 5
  end

  test "create employee" do
  end 	
end
