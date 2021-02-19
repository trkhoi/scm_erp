defmodule Scm.Schema.HistoricalData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "historical_data" do
    field(:month, :integer)
    field(:quantity, :integer)
    field(:description, :string)
    field(:shipment, :integer)

    belongs_to(:sales, Scm.Schema.Sales)
    timestamps()
  end

  @attrs [:month, :quantity, :description, :sales_id, :shipment]

  def changeset(historical_data, attrs) do
    historical_data
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
  end
end
