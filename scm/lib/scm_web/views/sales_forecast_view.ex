defmodule ScmWeb.SalesForecastView do
  use ScmWeb, :view

  def render("sales_forecast.json", %{sf: sf, pp: pp}) do
    %{
      data: %{
        sales_forecast: render_many(sf, ScmWeb.SalesForecastView, "sf.json"),
        product_plan: render_many(pp, ScmWeb.SalesForecastView, "pp.json")
      }
    }
  end

  def render("sf.json", sf) do
    %{
      month: sf.sales_forecast.month,
      forecast_value: sf.sales_forecast.forecast_value
    }
  end

  def render("pp.json", pp) do
    %{
      month: pp.sales_forecast.month,
      quantity: pp.sales_forecast.quantity
    }
  end

  def render("multiplicative.json", %{sales_forecast: sf}) do
    %{
      data: render_many(sf, ScmWeb.SalesForecastView, "multiplicative_detail.json")
    }
  end

  def render("multiplicative_detail.json", %{sales_forecast: sf}) do
    %{
      month: sf.month,
      week: sf.week,
      forecast_value: sf.forecast_value
    }
  end

  def render("additive.json", %{sales_forecast: sf}) do
    %{
      data: render_many(sf, ScmWeb.SalesForecastView, "additive_detail.json")
    }
  end

  def render("additive_detail.json", %{sales_forecast: sf}) do
    %{
      month: sf.month,
      week: sf.week,
      forecast_value: sf.forecast_value
    }
  end
end
