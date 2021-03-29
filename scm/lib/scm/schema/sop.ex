defmodule Scm.Schema.Sop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sop" do
    field(:year, :integer)
    field(:month, :integer)
    field(:note, :string)
    field(:resource_type, :string)
    field(:capacity, :integer)
    field(:utilization, :float)

    belongs_to(:sales, Scm.Schema.Sales)
    belongs_to(:sales_forecast, Scm.Schema.SalesForecast)

    timestamps()
  end

  @attrs [
    :year,
    :month,
    :note,
    :capacity,
    :utilization,
    :sales_id,
    :sales_forecast_id,
    :resource_type
  ]

  def changeset(sop, attrs) do
    sop
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
    |> foreign_key_constraint(:sales_forecast_id)
  end
end
