defmodule PayrollServices.SalariesServices do
  @moduledoc """
  PayrollServices.SalariesServices keeps the contexts that define your domain
  and business logic for specific salary oreinted processes

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  
  def calculate_tax(gross) when gross > 180000 do 
  	calculate_tax_bracket_4(gross)
  end
  def calculate_tax(gross) when gross > 80000 and gross < 180001 do 
  	calculate_tax_bracket_3(gross)
  end
  def calculate_tax(gross) when gross > 37000 and gross < 80001 do 
  	calculate_tax_bracket_2(gross)
  end
  def calculate_tax(gross) when gross > 18200 and gross < 37001 do 
  	calculate_tax_bracket_1(gross)
  end
  def calculate_tax(gross), do: 0

	
  defp calculate_tax_bracket_1(gross), do: Kernel.trunc(Float.round((0 + (gross - 18200) * 0.19) / 12))
  defp calculate_tax_bracket_2(gross), do: Kernel.trunc(Float.round((3572 + (gross - 37000) * 0.325) / 12)) 
  defp calculate_tax_bracket_3(gross), do: Kernel.trunc(Float.round((17547 + (gross - 80000) * 0.37) / 12))
  defp calculate_tax_bracket_4(gross), do: Kernel.trunc(Float.round((54547 + (gross - 180000) * 0.45) / 12))

end