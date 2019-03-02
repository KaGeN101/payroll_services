defmodule PayrollServices.Employees do
  @moduledoc """
  The Employees context - The database access context.
  """

  import Ecto.Query, warn: false
  alias PayrollServices.Repo
  alias HumanResources.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Searches for employee by id or by first or last name.
  """
  def search_employees(search_term) do
    case Integer.parse(search_term) do 
      {int_val, ""} -> 
        case Repo.get(Employee, int_val) do
          employee when is_map(employee) -> [employee]
          nil -> []
        end  
      _ ->  
      wildcard_search = "%#{search_term}%"

      query = from employee in Employee,
      where: ilike(employee.first_name, ^wildcard_search),
      or_where: ilike(employee.last_name, ^wildcard_search)
      Repo.all(query)
    end  
  end  

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    employee = Repo.preload(employee, :slips)
    for slip <- employee.slips do
      Repo.delete(slip)
    end  
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{source: %Employee{}}

  """
  def change_employee(%Employee{} = employee) do
    Employee.changeset(employee, %{})
  end

  def preload(%Employee{} = employee) do
    Repo.preload(employee, :slips)
  end
    
end