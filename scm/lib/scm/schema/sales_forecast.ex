defmodule Scm.Schema.SalesForecast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_forecast" do
    field(:month, :integer)
    field(:year, :integer)
    field(:promotion, :integer)
    field(:growth, :float)
    field(:product_type, :string)

    timestamps()
  end

  @attrs [:year, :month, :promotion, :growth]

  def changeset(sales_forecast, attrs) do
    sales_forecast
    |> cast(attrs, @attrs)
  end
end
