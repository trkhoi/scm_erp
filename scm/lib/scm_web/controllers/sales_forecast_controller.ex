defmodule ScmWeb.SalesForecastController do
  use ScmWeb, :controller

  alias Scm.Service.SalesForecast, as: SalesForecastService
  alias Scm.Schema.SalesForecast

  action_fallback(ScmWeb.FallbackController)

  def sales_forecast(conn, args) do
    sf = SalesForecastService.sales_forecast(args)
    pp = SalesForecastService.product_plan(args)

    render(conn, "sales_forecast.json", %{sf: sf, pp: pp})
  end
end
