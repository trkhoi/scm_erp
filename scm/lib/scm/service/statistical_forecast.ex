defmodule Scm.Service.StatisticalForecast do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{NewHistoricalData, SalesForecast, ForecastParameter}
  alias Scm.Service.SalesForecast, as: SalesForecastService

  def create(attrs \\ %{}) do
    %SalesForecast{}
    |> SalesForecast.changeset(attrs)
    |> Repo.insert()
  end

  def get_new_historical_data(sales_id) do
    NewHistoricalData
    |> select([nhd], nhd)
    |> where([nhd], nhd.sales_id == ^sales_id and nhd.year == 2020)
    |> Repo.all()
  end

  def get_nhd_by_id(id) do
    NewHistoricalData
    |> select([nhd], nhd)
    |> where([nhd], nhd.id == ^id)
    |> Repo.one()
  end

  def update_nhd(%NewHistoricalData{} = nhd, attrs) do
    nhd
    |> NewHistoricalData.changeset(attrs)
    |> Repo.update()
  end

  def get_forecast_parameter() do
    ForecastParameter
    |> select([fp], fp)
    |> where([fp], fp.forecast_type == "multiplicative")
    |> Repo.one()
  end

  def multiplicative_statistic_forecast(sales_id) do
    data = get_new_historical_data(sales_id)

    first_id = List.first(data).id
    last_id = List.last(data).id

    para = get_forecast_parameter()
    alpha = para.alpha
    beta = para.beta
    gamma = para.gamma
    c = 4

    SalesForecastService.check_multiplicative_sf(sales_id)
    |> case do
      n when n > 0 ->
        nil

      0 ->
        first_id..last_id
        |> Enum.reduce([], fn itm, acc ->
          uv = get_nhd_by_id(itm - 1)
          s = get_nhd_by_id(itm - c)
          y = get_nhd_by_id(itm)

          u_now = alpha * (y.quantity / s.season) + (1 - alpha) * (uv.baseline + uv.trend)
          v_now = beta * (u_now - uv.baseline) + (1 - beta) * uv.trend
          s_now = gamma * (y.quantity / u_now) + (1 - gamma) * s.season

          attrs = %{
            baseline: u_now,
            trend: v_now,
            season: s_now
          }

          update_nhd(y, attrs)
          pred = (uv.baseline + uv.trend) * s.season
          # acc ++ [pred]
          attrs_forecast =
            %{
              forecast_type: "multiplicative",
              year: y.year,
              month: y.month,
              week: y.week,
              forecast_value: pred,
              sales_id: sales_id
            }
            |> SalesForecastService.create_sf()
        end)
    end

    # sample_data =
    #   0..3
    #   |> Enum.map(fn itm ->
    #     tmp = Enum.at(data, itm)

    #     %{
    #       week: tmp.week,
    #       month: tmp.month,
    #       year: tmp.year,
    #       quantity: tmp.quantity
    #     }
    #   end)

    # sum_sample_data =
    #   sample_data
    #   |> Enum.reduce([], fn sd, acc ->
    #     acc ++ [sd.quantity]
    #   end)
    #   |> Enum.sum()

    # average_sample_data = sum_sample_data / 4

    # # the first 4 S of historical data
    # seasonal_value =
    #   sample_data
    #   |> Enum.map(fn itm ->
    #     %{
    #       week: itm.week,
    #       month: itm.month,
    #       year: itm.year,
    #       quantity: itm.quantity / average_sample_data
    #     }
    #   end)

    # # the first 4 U historical data
    # first_3_baseline_value =
    #   0..2
    #   |> Enum.map(fn itm ->
    #     tmp = Enum.at(data, itm)

    #     %{
    #       week: tmp.week,
    #       month: tmp.month,
    #       year: tmp.year,
    #       quantity: 0
    #     }
    #   end)

    # forth_baseline_value = Enum.at(data, 3).quantity / List.last(seasonal_value).quantity

    # baseline_value =
    #   first_3_baseline_value ++
    #     [
    #       %{
    #         week: Enum.at(data, 3).week,
    #         month: Enum.at(data, 3).month,
    #         year: Enum.at(data, 3).year,
    #         quantity: forth_baseline_value
    #       }
    #     ]

    # # the first 4 V historical data
    # trend_value =
    #   0..3
    #   |> Enum.map(fn itm ->
    #     tmp = Enum.at(data, itm)

    #     %{
    #       week: tmp.week,
    #       month: tmp.month,
    #       year: tmp.year,
    #       quantity: 0
    #     }
    #   end)

    # baseline_init_list =
    #   baseline_value
    #   |> Enum.reduce([], fn itm, acc ->
    #     acc ++ [itm.quantity]
    #   end)
    #   |> IO.inspect()

    # trend_init_list =
    #   trend_value
    #   |> Enum.reduce([], fn itm, acc ->
    #     acc ++ [itm.quantity]
    #   end)
    #   |> IO.inspect()

    # season_init_list =
    #   seasonal_value
    #   |> Enum.reduce([], fn itm, acc ->
    #     acc ++ [itm.quantity]
    #   end)
    #   |> IO.inspect()
  end
end
