defmodule Scm.Service.SalesForecast do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sales, HistoricalData, SalesForecast, ProductPlan}

  def create_sf(attrs \\ %{}) do
    %SalesForecast{}
    |> SalesForecast.changeset(attrs)
    |> Repo.insert()
  end

  def check_multiplicative_sf(sales_id) do
    SalesForecast
    |> select([sf], count(sf.id))
    |> where([sf], sf.forecast_type == "multiplicative" and sf.sales_id == ^sales_id)
    |> Repo.one()
  end

  def get_multiplicative_sf(sales_id) do
    SalesForecast
    |> select([sf], sf)
    |> where([sf], sf.forecast_type == "multiplicative" and sf.sales_id == ^sales_id)
    |> Repo.all()
  end

  def check_sf_in() do
    SalesForecast
    |> select([sf], sf)
    |> where([sf], sf.year == 2021)
    |> Repo.all()
    |> length()
  end

  def get_sf() do
    SalesForecast
    |> select([sf], sf)
    |> where([sf], sf.year == 2021)
    |> Repo.all()
  end

  def sales_forecast(args) do
    sales =
      Sales
      |> select([s], s)
      |> where([s], s.type == ^args["product"])
      |> preload([:historical_data])
      |> Repo.one()

    growth = 0.03
    promotion = %{1 => 400, 2 => 500, 3 => 450}
    months = Map.keys(promotion)

    check_sf_in()
    |> case do
      n when n > 0 ->
        get_sf()
        |> Enum.reduce([], fn sf, acc ->
          acc ++
            [
              %{
                month: sf.month,
                forecast_value: sf.forecast_value
              }
            ]
        end)

      0 ->
        sales.historical_data
        |> Enum.reduce([], fn hd, acc ->
          Enum.member?(months, hd.month)
          |> case do
            true ->
              create_sf(%{
                sales_id: sales.id,
                year: 2021,
                month: hd.month,
                promotion: promotion[hd.month],
                growth: growth,
                product_type: args["product"],
                forecast_value: hd.quantity + hd.quantity * growth + promotion[hd.month]
              })

              acc ++
                [
                  %{
                    month: hd.month,
                    forecast_value: hd.quantity + hd.quantity * growth + promotion[hd.month]
                  }
                ]

            false ->
              create_sf(%{
                sales_id: sales.id,
                year: 2021,
                month: hd.month,
                promotion: promotion[hd.month],
                growth: growth,
                product_type: args["product"],
                forecast_value: hd.quantity + hd.quantity * growth
              })

              acc ++
                [
                  %{
                    month: hd.month,
                    forecast_value: hd.quantity + hd.quantity * growth
                  }
                ]
          end
        end)
    end
  end

  def product_plan(args) do
    ProductPlan
    |> select([pp], pp)
    |> where([pp], pp.product_type == ^args["product"])
    |> Repo.all()
  end
end
