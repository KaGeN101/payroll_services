defmodule HumanResources.Slip do
  use Ecto.Schema
  import Ecto.Changeset


  schema "slips" do
    field :employee_id, :integer
    field :gross_income, :integer
    field :income_tax, :integer
    field :pay_period, :integer

    timestamps()
  end

  @doc false
  def changeset(slip, attrs) do
    slip
    |> cast(attrs, [:employee_id, :pay_period, :gross_income, :income_tax])
    |> validate_required([:employee_id, :pay_period, :gross_income, :income_tax])
  end
end
