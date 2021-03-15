defmodule ScmWeb.MpsView do
  use ScmWeb, :view

  def render("mps_daily.json", %{mps_daily: mps_daily}) do
    %{
      data: render_many(mps_daily, ScmWeb.MpsView, "mps.json")
    }
  end

  def render("mps.json", mps) do
    %{
      month: mps.mps.month,
      working_days_in_month: mps.mps.working_days_in_month,
      daily_demand: mps.mps.daily_mps
    }
  end

  def render("mps_weekly.json", %{mps_weekly: mps_weekly}) do
    %{
      data: render_many(mps_weekly, ScmWeb.MpsView, "mps_week.json")
    }
  end

  def render("mps_week.json", mps) do
    %{
      month: mps.mps.month,
      weekly_demand: mps.mps.weekly_demand,
      week: mps.mps.week
    }
  end

  def render("show.json", %{schedule: schedule}) do
    %{
      data: render_many(schedule, ScmWeb.MpsView, "schedule.json")
    }
  end

  def render("index.json", %{mps: mps}) do
    %{
      data: render_one(mps, ScmWeb.MpsView, "schedule.json")
    }
  end

  def render("schedule.json", schedule) do
    IO.inspect(schedule)

    %{
      component: schedule.mps.component,
      from_time: schedule.mps.from_time,
      to_time: schedule.mps.to_time,
      id: schedule.mps.id,
      product: schedule.mps.product.name
    }
  end

  def render("update_cp.json", %{cp: cp}) do
    %{
      data: %{
        applied_date: cp.applied_date,
        task: cp.component,
        from_time: cp.from_time,
        to_time: cp.to_time
      }
    }
  end
end
