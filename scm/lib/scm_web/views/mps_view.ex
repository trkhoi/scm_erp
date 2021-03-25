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
    IO.inspect(mps)

    %{
      month: mps.mps.month,
      weekly_demand: mps.mps.weekly_demand,
      week: mps.mps.week,
      working_days_in_week: mps.mps.working_days_in_week,
      working_days_in_month: mps.mps.working_days,
      monthly_demand: mps.mps.monthly_demand
    }
  end

  def render("show.json", %{schedule: schedule}) do
    %{
      data:
        %{
          events: render_many(schedule, ScmWeb.MpsView, "schedule.json")
        }
        |> Map.put(:resources, [
          %{
            id: 1,
            name: List.first(schedule).resource_type,
            parent_id: List.first(schedule).resource_parent
          }
        ])
    }
  end

  def render("index.json", %{mps: mps}) do
    %{
      data: %{
        events: render_one(mps, ScmWeb.MpsView, "schedule.json"),
        resources: render_one(mps, ScmWeb.MpsView, "resource.json")
      }
    }
  end

  def render("schedule.json", schedule) do
    %{
      title: schedule.mps.component,
      start: schedule.mps.from_time,
      end: schedule.mps.to_time,
      id: schedule.mps.id,
      product: schedule.mps.product.name,
      resourceId: 2
    }
  end

  def render("resource.json", schedule) do
    %{
      parentId: schedule.mps.resource_parent,
      name: schedule.mps.resource_type,
      id: 2
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
