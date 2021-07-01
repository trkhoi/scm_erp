defmodule Scm.Schema.AdditiveHistoricalData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "additive_historical_data" do
    field(:baseline, :float)
    field(:trend, :float)
    field(:season, :float)
    field(:forecast_type, :string)
    # field(:pred, :float)

    belongs_to(:new_historical_data, Scm.Schema.NewHistoricalData)
    belongs_to(:sales, Scm.Schema.Sales)
    timestamps()
  end

  @attrs [:baseline, :trend, :season, :forecast_type, :new_historical_data_id]

  def changeset(additive_historical_data, attrs) do
    additive_historical_data
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:new_historical_data_id)
    |> foreign_key_constraint(:sales_id)
  end
end
