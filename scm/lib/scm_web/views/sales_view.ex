defmodule ScmWeb.SalesView do
  use ScmWeb, :view

  def render("sale.json", %{sales: sales}) do
    %{
      data: %{
        unit_price: sales.unit_price,
        remain_quantity: sales.remain_quantity,
        id: sales.id,
        type: sales.type,
        name: sales.name
      }
    }
  end

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
      sale: report.sales.quantity,
      shipment: report.sales.shipment
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

  def render("finance_statistic.json", %{fs: fs}) do
    %{
      data: render_many(fs, ScmWeb.SalesView, "fs.json")
    }
  end

  def render("fs.json", fs) do
    %{
      month: fs.sales.month,
      quantity_sold: fs.sales.quantity,
      finance_value: fs.sales.finance_value
    }
  end
end
