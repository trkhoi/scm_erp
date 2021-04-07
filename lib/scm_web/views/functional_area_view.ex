defmodule ScmWeb.FunctionalAreaView do
  use ScmWeb, :view
  alias ScmWeb.FunctionalAreaView

  def render("index.json", %{functional_area: fa}) do
    %{
      data: %{
        events: render_many(fa.events, FunctionalAreaView, "events.json"),
        resources: render_many(fa.resources, FunctionalAreaView, "resource.json")
      }
    }
  end

  def render("show.json", %{functional_area: fa}) do
    %{
      data: %{
        events: render_one(fa.events, FunctionalAreaView, "events.json"),
        resources: render_one(fa.resources, FunctionalAreaView, "resource.json")
      }
    }
  end

  def render("events.json", %{functional_area: fa}) do
    %{
      title: fa.title,
      start: fa.from_time,
      end: fa.to_time,
      id: fa.id,
      resourceId: fa.functional_area_id
    }
  end

  def render("resource.json", %{functional_area: fa}) do
    %{
      id: fa.id,
      name: fa.name,
      parentId: nil
    }
  end
end
