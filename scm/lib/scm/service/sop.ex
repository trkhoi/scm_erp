defmodule Scm.Service.Sop do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sop, Sales, ProductPlan, SalesForecast, Storage}
  alias Scm.Service.ProductPlan, as: ProductPlanService

  def create_sop(attrs \\ %{}) do
    %Sop{}
    |> Sop.changeset(attrs)
    |> Repo.insert()
  end

  def update_sop(%Sop{} = sop, attrs) do
    sop
    |> Sop.changeset(attrs)
    |> Repo.update!()
  end

  def get_sf(sales_id, month, year) do
    SalesForecast
    |> select([sf], sf)
    |> where([sf], sf.sales_id == ^sales_id and sf.month == ^month and sf.year == ^year)
    |> Repo.one()
  end

  def update_fail_sop(args) do
    sales = Repo.get(Sales, args["sales_id"])

    ProductPlanService.get_pp_by_month_product_type(args["month"], sales.type)
    |> ProductPlanService.update_pp(%{quantity: args["quantity"]})
  end

  def get_sop_by_sales_id_month(sales_id, month) do
    Sop
    |> select([sop], sop)
    |> where([sop], sop.sales_id == ^sales_id and sop.month == ^month)
    |> Repo.one()
  end

  def sop_estimate(args) do
    last_year_inventory = args["inventory"]
    # IO.inspect(get_sf(args["sales_id"], 1, 2021))

    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    |> Enum.reduce([], fn month, acc ->
      sf = sf_by_month(args["sales_id"], month, 2021)
      pp = product_plan_by_month("lunar_cake", month)
      cap = capacity("lunar_cake", month)
      working_days()
      inventory = pp + last_year_inventory - sf

      create_sop(%{
        month: month,
        capacity: cap,
        year: 2021,
        utilization: pp / cap,
        sales_id: args["sales_id"],
        sales_forecast_id: get_sf(args["sales_id"], month, 2021).id
      })

      acc ++
        [
          %{
            month: month,
            forecast_value: sf,
            production_plan: pp,
            capacity: cap,
            working_days: 21,
            utilization: pp / cap,
            inventory: inventory
          }
        ]
    end)
  end

  def check_utilization(sops) do
    sop_fail =
      sops
      |> Enum.filter(fn sop ->
        sop.utilization > 0.9
      end)

    case length(sop_fail) do
      n when n > 0 ->
        sop_fail
        |> Enum.reduce([], fn sop, acc ->
          acc ++ [sop.month]
        end)

      0 ->
        []
    end
  end

  defp product_plan_by_month(product_type, month) do
    ProductPlan
    |> select([pp], pp.quantity)
    |> where([pp], pp.product_type == ^product_type and pp.month == ^month)
    |> Repo.one()
  end

  defp sf_by_month(id, month, year) do
    SalesForecast
    |> select([sf], sf.forecast_value)
    |> join(:inner, [sf], s in Sales, on: s.id == sf.sales_id)
    |> where([sf, s], s.id == ^id and sf.month == ^month and sf.year == ^year)
    |> Repo.one()
  end

  defp capacity(product_type, month) do
    Storage
    |> select([s], s.inventory)
    |> where([s], s.product_type == ^product_type and s.month == ^month)
    |> Repo.one()
  end

  defp working_days() do
    Enum.random(15..22)
  end
end
