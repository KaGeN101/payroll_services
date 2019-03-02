defmodule HumanResources.Employee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "employees" do
    field :annual_salary, :integer
    field :first_name, :string
    field :last_name, :string
    field :payment_start_date, :date
    field :pension_contribution, :integer
 
    has_many :slips, HumanResources.Slip

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :last_name, :annual_salary, :pension_contribution, :payment_start_date])
    |> validate_required([:first_name, :last_name, :annual_salary, :pension_contribution, :payment_start_date])
  end
end
