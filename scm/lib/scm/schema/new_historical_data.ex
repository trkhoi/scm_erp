defmodule Scm.Schema.NewHistoricalData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "new_historical_data" do
    field(:week, :integer)
    field(:month, :integer)
    field(:year, :integer)
    field(:quantity, :integer)
    field(:description, :string)
    field(:baseline, :float)
    field(:trend, :float)
    field(:season, :float)
    # field(:pred, :float)

    belongs_to(:sales, Scm.Schema.Sales)
    timestamps()
  end

  @attrs [:week, :year, :month, :quantity, :description, :sales_id, :baseline, :trend, :season]

  def changeset(historical_data, attrs) do
    historical_data
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
  end
end