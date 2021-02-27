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
end
