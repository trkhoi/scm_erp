defmodule Scm.Service.AnalyzeAffect do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{AnalyzeSocialNetwork, AffectingFactor, Sales, ForecastParameter}
  alias Scm.Service.StatisticalForecast, as: StatisticalForecastService

  def identify_level(level) do
    level
    |> case do
      "high" -> 0.3
      "medium" -> 0.2
      "low" -> 0.1
    end
  end

  def identify_change(change, forecast_type, level) do
    forecast_parameter =
      StatisticalForecastService.get_forecast_parameter_with_type(forecast_type)

    new_gamma =
      case change do
        true -> forecast_parameter.gamma + identify_level(level)
        false -> forecast_parameter.gamma - identify_level(level)
      end

    attrs = %{
      gamma: new_gamma
    }

    forecast_parameter
    |> ForecastParameter.changeset(attrs)
    |> Repo.update()
  end

  def get_forecast_affecting_factor(sales_product, forecast_type) do
    AffectingFactor
    |> select([a], a)
    |> preload([:analyze_social_network])
    |> Repo.all()
    |> Enum.filter(fn itm ->
      forecast_type in itm.forecasting_type
    end)
    |> List.first()
  end

  def analyze_affecting_factor(args) do
    sales = Repo.get(Sales, String.to_integer(args["sales_id"]))
    affecting = get_forecast_affecting_factor(sales.type, args["forecast_type"])
    change = sales.type in affecting.analyze_social_network.most_use_product

    identify_change(change, args["forecast_type"], affecting.level)
  end
end
