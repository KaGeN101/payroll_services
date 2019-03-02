defmodule PayrollServices.Salaries do
  @moduledoc """
  The Salaries context.
  """

  import Ecto.Query, warn: false
  alias PayrollServices.Repo

  alias HumanResources.Slip

  @doc """
  Returns the list of slips.

  ## Examples

      iex> list_slips()
      [%Slip{}, ...]

  """
  def list_slips do
    Repo.all(Slip)
  end

  @doc """
  Gets a single slip.

  Raises `Ecto.NoResultsError` if the Slip does not exist.

  ## Examples

      iex> get_slip!(123)
      %Slip{}

      iex> get_slip!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slip!(id) do 
    slip = Repo.get!(Slip, id)
    Repo.preload(slip, :employee)
  end  

  @doc """
  Creates a slip.

  ## Examples

      iex> create_slip(%{field: value})
      {:ok, %Slip{}}

      iex> create_slip(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slip(attrs \\ %{}) do
    PayrollServices.SalariesServices.create_next_slip(attrs["employee_id"])
  end

  @doc """
  Updates a slip.

  ## Examples

      iex> update_slip(slip, %{field: new_value})
      {:ok, %Slip{}}

      iex> update_slip(slip, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slip(%Slip{} = slip, attrs) do
    slip
    |> Slip.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Slip.

  ## Examples

      iex> delete_slip(slip)
      {:ok, %Slip{}}

      iex> delete_slip(slip)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slip(%Slip{} = slip) do
    Repo.delete(slip)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slip changes.

  ## Examples

      iex> change_slip(slip)
      %Ecto.Changeset{source: %Slip{}}

  """
  def change_slip(%Slip{} = slip) do
    Slip.changeset(slip, %{})
  end
end
