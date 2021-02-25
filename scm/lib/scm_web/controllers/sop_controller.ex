defmodule ScmWeb.SopController do
  use ScmWeb, :controller

  alias Scm.Service.SalesForecast, as: SalesForecastService
  alias Scm.Service.Sop, as: SopService

  action_fallback(ScmWeb.FallbackController)

  def sop(conn, args) do
    sop = SopService.sop_estimate(args)
    render(conn, "sop_estimate.json", %{sop: sop})
  end
end
