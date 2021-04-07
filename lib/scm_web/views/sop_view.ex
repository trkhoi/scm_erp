defmodule ScmWeb.SopView do
  use ScmWeb, :view

  def render("sop_estimate.json", %{sop: sop, mess: mess}) do
    %{
      message:
        case length(mess) do
          0 ->
            "All months accepted"

          n when n > 0 ->
            mess
        end,
      data: render_many(sop, ScmWeb.SopView, "sop.json")
    }
  end

  def render("sop.json", sop) do
    %{
      month: sop.sop.month,
      forecast_value: sop.sop.forecast_value,
      production_plan: sop.sop.production_plan,
      capacity: sop.sop.capacity,
      working_days: sop.sop.working_days,
      utilization: sop.sop.utilization,
      inventory: sop.sop.inventory
    }
  end
end
