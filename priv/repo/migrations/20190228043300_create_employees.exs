defmodule PayrollServices.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :first_name, :string
      add :last_name, :string
      add :annual_salary, :integer
      add :pension_contribution, :integer
      add :payment_start_date, :date

      timestamps()
    end

  end
end
