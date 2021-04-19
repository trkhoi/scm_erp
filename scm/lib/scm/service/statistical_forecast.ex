defmodule Scm.Service.StatisticalForecast do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{NewHistoricalData, SalesForecast, ForecastParameter}

  def create(attrs \\ %{}) do
    %SalesForecast{}
    |> SalesForecast.changeset(attrs)
    |> Repo.insert()
  end

  def get_new_historical_data(sales_id) do
    NewHistoricalData
    |> select([nhd], nhd)
    |> where([nhd], nhd.sales_id == ^sales_id)
    |> Repo.all()
  end

  def get_forecast_parameter() do
    ForecastParameter
    |> select([fp], fp)
    |> where([fp], fp.forecast_type == "multiplicative")
    |> Repo.one()
  end

  def multiplicative_statistic_forecast(sales_id) do
    data = get_new_historical_data(sales_id)

    sample_data =
      0..3
      |> Enum.map(fn itm ->
        tmp = Enum.at(data, itm)

        %{
          week: tmp.week,
          month: tmp.month,
          year: tmp.year,
          quantity: tmp.quantity
        }
      end)

    sum_sample_data =
      sample_data
      |> Enum.reduce([], fn sd, acc ->
        acc ++ [sd.quantity]
      end)
      |> Enum.sum()

    average_sample_data = sum_sample_data / 4

    # the first 4 S of historical data
    seasonal_value =
      sample_data
      |> Enum.map(fn itm ->
        %{
          week: itm.week,
          month: itm.month,
          year: itm.year,
          quantity: itm.quantity / average_sample_data
        }
      end)
      |> IO.inspect()

    # the first 4 U historical data
    first_3_baseline_value =
      0..2
      |> Enum.map(fn itm ->
        tmp = Enum.at(data, itm)

        %{
          week: tmp.week,
          month: tmp.month,
          year: tmp.year,
          quantity: 0
        }
      end)

    forth_baseline_value = Enum.at(data, 3).quantity / List.last(seasonal_value).quantity

    baseline_value =
      first_3_baseline_value ++
        [
          %{
            week: Enum.at(data, 3).week,
            month: Enum.at(data, 3).month,
            year: Enum.at(data, 3).year,
            quantity: forth_baseline_value
          }
        ]

    # the first 4 V historical data
    trend_value =
      0..3
      |> Enum.map(fn itm ->
        tmp = Enum.at(data, itm)

        %{
          week: tmp.week,
          month: tmp.month,
          year: tmp.year,
          quantity: 0
        }
      end)
      |> IO.inspect()
  end
end
