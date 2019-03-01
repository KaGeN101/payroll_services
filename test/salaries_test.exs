defmodule PayrollServices.SalariesTest do
  use ExUnit.Case 

  #alias PayrollServices.Salaries

 
    alias Salaries.Slip

    @valid_attrs %{employee_id: 42, gross_income: 42, income_tax: 42, pay_period: 42}
    @update_attrs %{employee_id: 43, gross_income: 43, income_tax: 43, pay_period: 43}
    @invalid_attrs %{employee_id: nil, gross_income: nil, income_tax: nil, pay_period: nil}

    def slip_fixture(attrs \\ %{}) do
      {:ok, slip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PayrollServices.Salaries.create_slip()

      slip
    end

    test "list_slips/0 returns all slips" do
      slip = slip_fixture()
      assert Enum.count(PayrollServices.Salaries.list_slips()) >= 1
    end

    test "get_slip!/1 returns the slip with given id" do
      slip = slip_fixture()
      assert PayrollServices.Salaries.get_slip!(slip.id) == slip
    end

    test "create_slip/1 with valid data creates a slip" do
      assert {:ok, %Slip{} = slip} = PayrollServices.Salaries.create_slip(@valid_attrs)
      assert slip.employee_id == 42
      assert slip.gross_income == 42
      assert slip.income_tax == 42
      assert slip.pay_period == 42
    end

    test "create_slip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PayrollServices.Salaries.create_slip(@invalid_attrs)
    end

    test "update_slip/2 with valid data updates the slip" do
      slip = slip_fixture()
      assert {:ok, %Slip{} = slip} = PayrollServices.Salaries.update_slip(slip, @update_attrs)
      assert slip.employee_id == 43
      assert slip.gross_income == 43
      assert slip.income_tax == 43
      assert slip.pay_period == 43
    end

    test "update_slip/2 with invalid data returns error changeset" do
      slip = slip_fixture()
      assert {:error, %Ecto.Changeset{}} = PayrollServices.Salaries.update_slip(slip, @invalid_attrs)
      assert slip == PayrollServices.Salaries.get_slip!(slip.id)
    end

    test "delete_slip/1 deletes the slip" do
      slip = slip_fixture()
      assert {:ok, %Slip{}} = PayrollServices.Salaries.delete_slip(slip)
      assert_raise Ecto.NoResultsError, fn -> PayrollServices.Salaries.get_slip!(slip.id) end
    end

    test "change_slip/1 returns a slip changeset" do
      slip = slip_fixture()
      assert %Ecto.Changeset{} = PayrollServices.Salaries.change_slip(slip)
    end

end
