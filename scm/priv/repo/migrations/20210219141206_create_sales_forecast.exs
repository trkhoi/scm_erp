defmodule Scm.Repo.Migrations.CreateSalesForecast do
  use Ecto.Migration

  def change do
    create table(:forecast_parameter) do
      add(:alpha, :float)
      add(:beta, :float)
      add(:gamma, :float)
      add(:seasonal_cycle, :integer)
      add(:forecast_type, :string)
      timestamps()
    end

    create table(:sales_forecast) do
      add(:product_type, :string)
      add(:growth, :float)
      add(:promotion, :integer)
      add(:month, :integer)
      add(:year, :integer)

      add(:forecast_type, :string)

      add(:forecast_parameter_id, references(:forecast_parameter))

      timestamps()
    end
  end
end
