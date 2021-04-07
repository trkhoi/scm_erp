defmodule ScmWeb.MpsController do
  use ScmWeb, :controller

  alias Scm.Repo
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

  def schedule(conn, args) do
    schedule =
      MpsService.detail_schedule(args)
      |> MpsService.normalize_schedule()

    render(conn, "show.json", %{schedule: schedule})
  end

  def detail_schedule(conn, args) do
    mps = ComponentProductService.get_component(args["id"])
    render(conn, "index.json", %{mps: mps})
  end

  def create_schedule(conn, args) do
    ComponentProductService.get_component_with_date(args)
    |> Repo.preload([:product])
    |> case do
      nil ->
        {:ok, cp} = ComponentProductService.normalize_args(args)
        mps = ComponentProductService.get_cp(cp.id)

        render(conn, "index.json", %{mps: mps})

      mps ->
        render(conn, "index.json", %{mps: mps})
    end
  end

  def update_schedule(conn, args) do
    {:ok, mps} =
      ComponentProductService.get_component(args["id"])
      |> ComponentProductService.update_component(%{
        from_time: args["from_time"],
        to_time: args["to_time"]
      })

    render(conn, "index.json", %{mps: mps})
  end
end
