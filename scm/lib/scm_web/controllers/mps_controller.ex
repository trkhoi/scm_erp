defmodule ScmWeb.MpsController do
  use ScmWeb, :controller

  alias Scm.Service.Mps, as: MpsService
  alias Scm.Schema.Mps

  action_fallback(ScmWeb.FallbackController)

  def daily_mps(conn, args) do
    mps_daily = MpsService.mps_daily(args)
    render(conn, "mps_daily.json", %{mps_daily: mps_daily})
  end

  def weekly_mps(conn, args) do
    mps_weekly =
      MpsService.mps_daily(args)
      |> MpsService.mps_weekly(args)

    render(conn, "mps_weekly.json", %{mps_weekly: mps_weekly})
  end

  def detail_schedule(conn, args) do
    MpsService.detail_schedule(args)
    |> MpsService.normalize_schedule()
    |> IO.inspect()
  end
end
