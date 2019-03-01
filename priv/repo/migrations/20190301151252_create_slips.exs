defmodule HrPortal.Repo.Migrations.CreateSlips do
  use Ecto.Migration

  def change do
    create table(:slips) do
      add :employee_id, :integer
      add :pay_period, :integer
      add :gross_income, :integer
      add :income_tax, :integer

      timestamps()
    end

  end
end
