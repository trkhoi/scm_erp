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
end
