defmodule ScmWeb.SopComponentView do
  use ScmWeb, :view
  alias ScmWeb.SopComponentView

  def render("index.json", %{sop_component: sop_component}) do
    %{
      data: %{
        events: render_many(sop_component.sop_c, SopComponentView, "sop_component.json"),
        resources: render_many(sop_component.sop, SopComponentView, "resource.json")
      }
    }
  end

  def render("show.json", %{sop_component: sop_component}) do
    %{
      data: %{
        events: render_one(sop_component, SopComponentView, "sop_component.json"),
        resources: render_one(sop_component.sop, SopComponentView, "resource.json")
      }
    }
  end

  def render("sop_component.json", %{sop_component: sop_component}) do
    %{
      title: sop_component.component,
      start: sop_component.from_time,
      end: sop_component.to_time,
      quantity: sop_component.quantity,
      id: sop_component.id,
      resourceId: sop_component.sop_id
      # resource_parent: sop_component.resource_parent,
      # resource_type: sop_component.resource_type
    }
  end

  def render("resource.json", %{sop_component: sop}) do
    %{
      id: sop.id,
      name: sop.resource_type,
      parentId: sop.sales_id
    }
  end
end
