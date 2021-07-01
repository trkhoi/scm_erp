defmodule Scm.Schema.Sales do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field(:year, :integer)
    field(:title, :string)
    field(:description, :string)
    field(:type, :string)
    field(:unit_price, :float)
    field(:remain_quantity, :float)
    field(:name, :string)

    has_many(:historical_data, Scm.Schema.HistoricalData)
    has_one(:sales_forecast, Scm.Schema.SalesForecast)
    has_many(:sales, Scm.Schema.Product)
    has_one(:sop, Scm.Schema.Sop)
    timestamps()
  end

  @attrs [:year, :title, :description, :type, :unit_price, :remain_quantity, :name]

  def changeset(sales, attrs) do
    sales
    |> cast(attrs, @attrs)
  end
end
