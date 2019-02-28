defmodule PayrollServices.Repo do
  use Ecto.Repo, 
    otp_app: :payroll_services,
    adapter: Ecto.Adapters.Postgres
end
