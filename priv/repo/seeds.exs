# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bla.Repo.insert!(%Bla.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


sybrand = PayrollServices.Repo.insert!(%HumanResources.Employee{first_name: "Sybrand", last_name: "Viljoen", annual_salary: 335577, pension_contribution: 18, payment_start_date: ~D[2019-06-01]})
PayrollServices.Repo.insert!(%HumanResources.Employee{first_name: "Bettie", last_name: "Maree", annual_salary: 110450, pension_contribution: 28, payment_start_date: ~D[2019-07-01]})
PayrollServices.Repo.insert!(%HumanResources.Employee{first_name: "Frank", last_name: "Sinatra", annual_salary: 265777, pension_contribution: 25, payment_start_date: ~D[2019-08-01]})
PayrollServices.Repo.insert!(%HumanResources.Employee{first_name: "Liam", last_name: "Neeson", annual_salary: 289123, pension_contribution: 15, payment_start_date: ~D[2019-09-01]})
PayrollServices.Repo.insert!(%HumanResources.Employee{first_name: "Michelle", last_name: "Rodriguez", annual_salary: 100000, pension_contribution: 10, payment_start_date: ~D[2019-10-01]})


sybrand_slip = PayrollServices.Repo.insert!(%HumanResources.Slip{
	employee_id: sybrand.id, 
	gross_income: Kernel.trunc(Float.round(sybrand.annual_salary/12)), 
	income_tax: PayrollServices.SalariesServices.calculate_tax(sybrand.annual_salary), 
	pay_period: 3
})
