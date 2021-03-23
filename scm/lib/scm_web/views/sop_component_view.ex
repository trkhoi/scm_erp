defmodule ScmWeb.SopComponentView do
  use ScmWeb, :view
  alias ScmWeb.SopComponentView

  def render("index.json", %{sop_component: sop_component}) do
    %{
      data:
        %{
          events: render_many(sop_component, SopComponentView, "sop_component.json")
          # resource: render_many(sop_components, SopComponentView, "sop_component.json")
        }
        |> Map.put(:resource, %{
          id: 1,
          name: List.first(sop_component).resource_type,
          parent_id: List.first(sop_component).resource_parent
        })
    }
  end

  def render("show.json", %{sop_component: sop_component}) do
    %{
      data: %{
        events: render_one(sop_component, SopComponentView, "sop_component.json"),
        resource: render_one(sop_component, SopComponentView, "resource.json")
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
      resourceId: 1
      # resource_parent: sop_component.resource_parent,
      # resource_type: sop_component.resource_type
    }
  end

  def render("resource.json", %{sop_component: sop_component}) do
    %{
      id: 1,
      name: sop_component.resource_type,
      parentId: sop_component.resource_parent
    }
  end
end
