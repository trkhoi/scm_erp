defmodule ScmWeb.SopController do
  use ScmWeb, :controller

  alias Scm.Service.SalesForecast, as: SalesForecastService
  alias Scm.Service.Sop, as: SopService

  action_fallback(ScmWeb.FallbackController)

  def sop(conn, args) do
    sop = SopService.sop_estimate(args)
    mess = SopService.check_utilization(sop)
    render(conn, "sop_estimate.json", %{sop: sop, mess: mess})
  end

  def update_sop(conn, args) do
    SopService.update_fail_sop(args)

    conn
    |> put_status(:created)
    |> json(%{
      data: "OK"
    })
  end
end
