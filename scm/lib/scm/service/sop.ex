defmodule Scm.Service.Sop do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sop, Sales, ProductPlan, SalesForecast, Storage}

  def sop_estimate(args) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    |> Enum.reduce([], fn month, acc ->
      IO.inspect("this is month " <> Integer.to_string(month))
      sf_by_month(args["sales_id"], month)
      pp = product_plan_by_month("lunar_cake", month)
      cap = capacity("lunar_cake", month)
      working_days()

      utilization =
        (pp / cap)
        |> IO.inspect()
    end)
  end

  defp product_plan_by_month(product_type, month) do
    ProductPlan
    |> select([pp], pp.quantity)
    |> where([pp], pp.product_type == ^product_type and pp.month == ^month)
    |> Repo.one()
    |> IO.inspect()
  end

  defp sf_by_month(id, month) do
    SalesForecast
    |> select([sf], sf.forecast_value)
    |> join(:inner, [sf], s in Sales, on: s.id == sf.sales_id)
    |> where([sf, s], s.id == ^id and sf.month == ^month)
    |> Repo.one()
    |> IO.inspect()
  end

  defp capacity(product_type, month) do
    Storage
    |> select([s], s.inventory)
    |> where([s], s.product_type == ^product_type and s.month == ^month)
    |> Repo.one()
    |> IO.inspect()
  end

  defp working_days() do
    Enum.random(15..22)
    |> IO.inspect()
  end
end
