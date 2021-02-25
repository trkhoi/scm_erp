defmodule Scm.Service.ProductPlan do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sop, Sales, ProductPlan, SalesForecast, Storage}

  def update_pp(%ProductPlan{} = product_plan, attrs) do
    product_plan
    |> ProductPlan.changeset(attrs)
    |> Repo.update()
    |> IO.inspect()
  end

  def get_pp_by_month_product_type(month, type) do
    ProductPlan
    |> select([pp], pp)
    |> where([pp], pp.month == ^month and pp.product_type == ^type)
    |> Repo.one()
  end
end
