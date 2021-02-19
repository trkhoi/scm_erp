defmodule Scm.Service.SalesForecast do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sales, HistoricalData, SalesForecast, ProductPlan}

  def sales_forecast(args) do
    sales =
      Sales
      |> select([s], s)
      |> where([s], s.type == ^args["product"])
      |> preload([:historical_data])
      |> Repo.one()

    # |> IO.inspect()

    growth = 0.03
    promotion = %{1 => 400, 2 => 500, 3 => 450}
    months = Map.keys(promotion)

    sales.historical_data
    |> Enum.reduce([], fn hd, acc ->
      Enum.member?(months, hd.month)
      |> case do
        true ->
          acc ++
            [
              %{
                month: hd.month,
                forecast_value: hd.quantity + hd.quantity * growth + promotion[hd.month]
              }
            ]

        false ->
          acc ++
            [
              %{
                month: hd.month,
                forecast_value: hd.quantity + hd.quantity * growth
              }
            ]
      end
    end)
    |> IO.inspect()
  end

  def product_plan(args) do
    ProductPlan
    |> select([pp], pp)
    |> where([pp], pp.product_type == ^args["product"])
    |> Repo.all()
    |> IO.inspect()
  end
end
