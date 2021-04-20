defmodule ScmWeb.SalesForecastController do
  use ScmWeb, :controller

  alias Scm.Service.SalesForecast, as: SalesForecastService
  alias Scm.Schema.SalesForecast
  alias Scm.Service.StatisticalForecast

  action_fallback(ScmWeb.FallbackController)

  def sales_forecast(conn, args) do
    sf = SalesForecastService.sales_forecast(args)
    pp = SalesForecastService.product_plan(args)

    render(conn, "sales_forecast.json", %{sf: sf, pp: pp})
  end

  def multiplicative(conn, %{"sales_id" => sales_id}) do
    StatisticalForecast.multiplicative_statistic_forecast(sales_id)
    json(conn, %{})
  end

  def index(conn, %{"sales_id" => sales_id}) do
    sf = SalesForecastService.get_multiplicative_sf(sales_id)
    render(conn, "multiplicative.json", %{sales_forecast: sf})
  end
end
