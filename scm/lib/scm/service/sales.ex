defmodule Scm.Service.Sales do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Sales, HistoricalData}

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
                quantity: Map.get(data, :quantity, 0)
              }
            ]
        end)
    }
  end
end
