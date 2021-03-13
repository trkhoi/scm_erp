defmodule Scm.Schema.Sales do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field(:year, :integer)
    field(:title, :string)
    field(:description, :string)
    field(:type, :string)

    has_many(:historical_data, Scm.Schema.HistoricalData)
    has_one(:sales_forecast, Scm.Schema.SalesForecast)
    belongs_to(:product, Scm.Schema.Product)
    has_one(:sop, Scm.Schema.Sop)
    timestamps()
  end

  @attrs [:year, :title, :description, :type]

  def changeset(sales, attrs) do
    sales
    |> cast(attrs, @attrs)
  end
end
