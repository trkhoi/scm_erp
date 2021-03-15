defmodule ScmWeb.SopComponentView do
  use ScmWeb, :view
  alias ScmWeb.SopComponentView

  def render("index.json", %{sop_component: sop_component}) do
    %{data: render_many(sop_component, SopComponentView, "sop_component.json")}
  end

  def render("show.json", %{sop_component: sop_component}) do
    %{data: render_one(sop_component, SopComponentView, "sop_component.json")}
  end

  def render("sop_component.json", %{sop_component: sop_component}) do
    %{
      component: sop_component.component,
      from_time: sop_component.from_time,
      to_time: sop_component.to_time,
      quantity: sop_component.quantity,
      id: sop_component.id,
      resource_parent: sop_component.resource_parent,
      resource_type: sop_component.resource_type
    }
  end
end
