defmodule ScmWeb.SalesView do
  use ScmWeb, :view

  def render("sales.json", %{sales: sales}) do
    %{
      data: %{
        id: sales.id,
        type: sales.type,
        title: sales.title,
        description: sales.description,
        report: render_many(sales.report, ScmWeb.SalesView, "historical_data.json")
      }
    }
  end

  def render("historical_data.json", report) do
    %{
      month: report.sales.month,
      quantity: report.sales.quantity
    }
  end
end
