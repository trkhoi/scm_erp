defmodule ScmWeb.MpsController do
  use ScmWeb, :controller

  alias Scm.Service.Mps, as: MpsService
  alias Scm.Service.ComponentProduct, as: ComponentProductService
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
    schedule =
      MpsService.detail_schedule(args)
      |> MpsService.normalize_schedule()

    render(conn, "show.json", %{schedule: schedule})
  end

  def create_schedule(conn, args) do
    ComponentProductService.get_component_with_date(args)
    |> case do
      nil ->
        {:ok, cp} = ComponentProductService.normalize_args(args) |> IO.inspect()
        mps = ComponentProductService.get_cp(cp.id)

        render(conn, "index.json", %{mps: mps})

      cp ->
        {:error, :bad_request, reason: "already schedule for this day"}
    end
  end

  def update_schedule(conn, args) do
    {:ok, cp} =
      ComponentProductService.get_component(args["id"])
      |> ComponentProductService.update_component(args)

    render(conn, "update_cp.json", %{cp: cp})
  end
end
