defmodule PayrollServices.Employees do
  @moduledoc """
  Provides a host of services with regards to being an employee
  """

  alias PayrollServices.Repo


  def fetch do
  	Repo.all(HumanResources.Employee)
  end

  def create(attrs \\ %{}) do
    
  end

end