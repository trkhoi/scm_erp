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

  def render("evaluate.json", %{eva: eva}) do
    %{
      data: %{
        my_product: %{
          code: eva.my_product.code,
          name: eva.my_product.name,
          price: eva.my_product.price
        },
        opponent_product: render_many(eva.opponent_product, ScmWeb.SalesView, "opponent.json")
      }
    }
  end

  def render("opponent.json", opponent) do
    %{
      company: opponent.sales.company,
      price: opponent.sales.price,
      product_type: opponent.sales.product_type
    }
  end
end
