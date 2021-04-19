defmodule Scm.Schema.ForecastParameter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forecast_parameter" do
    field(:alpha, :float)
    field(:beta, :float)
    field(:gamma, :float)
    field(:forecast_type, :string)
    field(:seasonal_cycle, :integer)

    has_many(:sales_forecast, Scm.Schema.SalesForecast)
    timestamps()
  end

  @attrs [:alpha, :beta, :gamma, :forecast_type, :seasonal_cycle]

  def changeset(historical_data, attrs) do
    historical_data
    |> cast(attrs, @attrs)
  end
end
