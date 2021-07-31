defmodule Scm.Service.StatisticalForecast do
  import Ecto.Query, warn: false
  alias Scm.Repo
  alias Ecto.Changeset

  alias Scm.Schema.{NewHistoricalData, SalesForecast, ForecastParameter, AdditiveHistoricalData}
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
    |> order_by(asc: :id)
    |> Repo.all()
  end

  def get_nhd_by_id(id) do
    NewHistoricalData
    |> select([nhd], nhd)
    |> where([nhd], nhd.id == ^id)
    |> Repo.one()
  end

  def get_additive_nhd_by_id(id, sales_id) do
    AdditiveHistoricalData
    |> select([ahd], ahd)
    |> where([ahd], ahd.id == ^id)
    |> preload(:new_historical_data)
    |> Repo.one()
  end

  def update_nhd(%NewHistoricalData{} = nhd, attrs) do
    nhd
    |> NewHistoricalData.changeset(attrs)
    |> Repo.update()
  end

  def update_ahd(%AdditiveHistoricalData{} = nhd, attrs) do
    nhd
    |> AdditiveHistoricalData.changeset(attrs)
    |> Repo.update()
  end

  def get_forecast_parameter() do
    ForecastParameter
    |> select([fp], fp)
    |> where([fp], fp.forecast_type == "multiplicative")
    |> Repo.one()
  end

  def get_forecast_parameter_with_type(forecast_type) do
    ForecastParameter
    |> select([fp], fp)
    |> where([fp], fp.forecast_type == ^forecast_type)
    |> Repo.one()
  end

  def get_additive_forecast_parameter() do
    ForecastParameter
    |> select([fp], fp)
    |> where([fp], fp.forecast_type == "additive")
    |> preload(:new_historical_data)
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
        all_old_sales = SalesForecastService.get_all_old_sf(sales_id, "multiplicative")

        Repo.delete_all(all_old_sales)

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
  end

  def additive_statistic_forecast(sales_id) do
    data = get_new_historical_data(sales_id)

    first_id = List.first(data).id
    last_id = List.last(data).id

    para = get_forecast_parameter()
    alpha = para.alpha
    beta = para.beta
    gamma = para.gamma
    c = para.seasonal_cycle

    SalesForecastService.check_additive_sf(sales_id)
    |> case do
      n when n > 0 ->
        all_old_sales = SalesForecastService.get_all_old_sf(sales_id, "additive")

        Repo.delete_all(all_old_sales)

        first_id..last_id
        |> Enum.reduce([], fn itm, acc ->
          uv = get_nhd_by_id(itm - 1)
          s = get_nhd_by_id(itm - c)
          y = get_nhd_by_id(itm)

          u_now =
            alpha * (y.new_historical_data.quantity - s.season_add) +
              (1 - alpha) * (uv.baseline_add + uv.trend_add)

          v_now = beta * (u_now - uv.baseline_add) + (1 - beta) * uv.trend_add

          s_now =
            gamma * (y.new_historical_data.quantity - uv.baseline_add - uv.trend_add) +
              (1 - gamma) * s.season_add

          attrs = %{
            baseline_add: u_now,
            trend_add: v_now,
            season_add: s_now
          }

          update_nhd(y, attrs)
          pred = (uv.baseline_add + uv.trend_add) * s.season_add

          attrs_forecast =
            %{
              forecast_type: "additive",
              year: y.year,
              month: y.month,
              week: y.week,
              forecast_value: pred,
              sales_id: sales_id
            }
            |> SalesForecastService.create_sf()
        end)

      0 ->
        first_id..last_id
        |> Enum.reduce([], fn itm, acc ->
          uv = get_nhd_by_id(itm - 1)
          s = get_nhd_by_id(itm - c)
          y = get_nhd_by_id(itm)

          u_now =
            alpha * (y.quantity - s.season_add) +
              (1 - alpha) * (uv.baseline_add + uv.trend_add)

          v_now = beta * (u_now - uv.baseline_add) + (1 - beta) * uv.trend_add

          s_now =
            gamma * (y.quantity - uv.baseline_add) +
              (1 - gamma) * s.season_add

          attrs = %{
            baseline_add: u_now,
            trend_add: v_now,
            season_add: s_now
          }

          update_nhd(y, attrs)
          pred = (uv.baseline_add + uv.trend_add) * s.season_add

          attrs_forecast =
            %{
              forecast_type: "additive",
              year: y.year,
              month: y.month,
              week: y.week,
              forecast_value: pred,
              sales_id: sales_id
            }
            |> SalesForecastService.create_sf()
        end)
    end

    # |> case do
    #   n when n > 0 ->
    #     nil

    #   0 ->
    #     first_id..last_id
    #     |> Enum.reduce([], fn itm, acc ->
    #       additive =
    #         Changeset.change(%AdditiveHistoricalData{}, %{
    #           forecast_type: "additive",
    #           new_historical_data_id: itm,
    #           sales_id: sales_id
    #         })
    #         |> Repo.insert()

    #       uv = get_additive_nhd_by_id(itm - 1, sales_id)
    #       s = get_additive_nhd_by_id(itm - c, sales_id)
    #       y = get_additive_nhd_by_id(itm, sales_id)
    #       IO.inspect(uv)
    #       IO.inspect(s)
    #       IO.inspect(y)

    #       u_now =
    #         alpha * (y.new_historical_data.quantity - s.season) +
    #           (1 - alpha) * (uv.baseline + uv.trend)

    #       v_now = beta * (u_now - uv.baseline) + (1 - beta) * uv.trend

    #       s_now =
    #         gamma * (y.new_historical_data.quantity - uv.baseline) +
    #           (1 - gamma) * s.season

    #       attrs = %{
    #         baseline: u_now,
    #         trend: v_now,
    #         season: s_now,
    #         sales_id: sales_id
    #       }

    #       {:ok, y_} = update_ahd(y, attrs)

    #       pred = uv.baseline + uv.trend + y_.season

    #       attrs_forecast =
    #         %{
    #           forecast_type: "additive",
    #           year: y.new_historical_data.year,
    #           month: y.new_historical_data.month,
    #           week: y.new_historical_data.week,
    #           forecast_value: pred,
    #           sales_id: sales_id
    #         }
    #         |> SalesForecastService.create_sf()
    #     end)
    # end
  end
end
