defmodule Scm.Schema.SalesForecast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_forecast" do
    field(:month, :integer)
    field(:year, :integer)
    field(:promotion, :integer)
    field(:growth, :float)
    field(:product_type, :string)
    field(:forecast_value, :float)

    belongs_to(:sales, Scm.Schema.Sales)
    belongs_to(:forecast_parameter, Scm.Schema.ForecastParameter)

    timestamps()
  end

  @attrs [
    :year,
    :month,
    :promotion,
    :growth,
    :product_type,
    :forecast_value,
    :sales_id,
    :forecast_parameter_id
  ]

  def changeset(sales_forecast, attrs) do
    sales_forecast
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
    |> foreign_key_constraint(:forecast_parameter_id)
  end
end
