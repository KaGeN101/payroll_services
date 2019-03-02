defmodule HumanResources.Slip do
  use Ecto.Schema
  import Ecto.Changeset

 
  @period_lookup %{
    1 => "1 March YEAR - 31 March YEAR",
    2 => "1 April YEAR - 30 April YEAR",
    3 => "1 May YEAR - 31 May YEAR",
    4 => "1 June YEAR - 30 June YEAR",
    5 => "1 July YEAR - 31 July YEAR",
    6 => "1 August YEAR - 31 August YEAR",
    7 => "1 September YEAR - 30 September YEAR",
    8 => "1 October YEAR - 31 October YEAR",
    9 => "1 November YEAR - 30 Novemeber YEAR",
    10 => "1 December YEAR - 31 December YEAR",
    11 => "1 January YEAR - 31 January YEAR",
    12 => "1 February YEAR - 31 February YEAR"
  }


  schema "slips" do
    #field :employee_id, :integer
    field :gross_income, :integer
    field :income_tax, :integer
    field :pay_period, :integer

    belongs_to :employee, HumanResources.Employee

    timestamps()
  end

  @doc false
  def changeset(slip, attrs) do
    slip
    |> cast(attrs, [:employee_id, :pay_period, :gross_income, :income_tax])
    |> validate_required([:employee_id, :pay_period, :gross_income, :income_tax])
  end

  def net_income(gross_income, income_tax) do
    Kernel.trunc(Float.round(gross_income - income_tax))
  end
  
  def pension(employee) do
     Kernel.trunc(Float.round((employee.annual_salary/12) * (employee.pension_contribution / 100)))
  end    

  def pay_period_to_s(period) do
    @period_lookup[period]
    |> String.replace("YEAR", Integer.to_string(DateTime.utc_now.year))
  end
end
