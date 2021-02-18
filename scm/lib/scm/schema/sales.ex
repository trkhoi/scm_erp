defmodule Scm.Schema.Sales do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field(:year, :integer)
    field(:title, :string)
    field(:description, :string)
    field(:type, :string)

    has_many(:historical_data, Scm.Schema.HistoricalData)
    timestamps()
  end

  @attrs [:year, :title, :description, :type]

  def changeset(sales, attrs) do
    sales
    |> cast(attrs, @attrs)
  end
end
