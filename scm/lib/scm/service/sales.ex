defmodule Scm.Service.Sales do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sales, HistoricalData, Product, Market}

  def get_sales(id) do
    Repo.get(Sales, id)
  end

  def get_sales_with_historical_data(args) do
    Sales
    |> select([s], s)
    |> where([s], s.type == ^args["type"])
    |> preload(:historical_data)
    |> Repo.one()
    |> normalize_output()
  end

  defp normalize_output(sales) do
    %{
      id: Map.get(sales, :id, 0),
      type: Map.get(sales, :type, ""),
      title: Map.get(sales, :title, ""),
      description: Map.get(sales, :description, ""),
      report:
        sales.historical_data
        |> Enum.reduce([], fn data, acc ->
          acc ++
            [
              %{
                month: Map.get(data, :month, 0),
                quantity: Map.get(data, :quantity, 0),
                shipment: Map.get(data, :shipment, 0)
              }
            ]
        end)
    }
  end

  def evaluate_market(args) do
    product =
      Product
      |> select([p], p)
      |> where([p], p.code == ^args["type"] and p.feature == "forecasting")
      |> Repo.one()

    market =
      Market
      |> select([m], m)
      |> where([m], m.product_type == ^args["type"])
      |> Repo.all()

    %{
      my_product: %{
        code: Map.get(product, :code, ""),
        name: Map.get(product, :name, ""),
        price: Map.get(product, :price, 0.0)
      },
      opponent_product:
        market
        |> Enum.reduce([], fn opponent, acc ->
          acc ++
            [
              %{
                company: opponent.company,
                product_type: opponent.product_type,
                price: opponent.price
              }
            ]
        end)
    }
  end

  def finance_statistic(args) do
    product =
      Product
      |> select([p], p)
      |> where([p], p.code == ^args["product"] and p.feature == "forecasting")
      |> Repo.one()

    price = Map.get(product, :price, 0)

    HistoricalData
    |> select([hd], hd)
    |> join(:inner, [hd], s in Sales, on: hd.sales_id == s.id)
    |> where([hd, s], s.type == ^args["product"])
    |> Repo.all()
    |> Enum.reduce([], fn hd, acc ->
      acc ++
        [
          %{
            month: Map.get(hd, :month, 0),
            quantity: Map.get(hd, :quantity, 0),
            finance_value: Map.get(hd, :quantity, 0) * price
          }
        ]
    end)
  end
end
