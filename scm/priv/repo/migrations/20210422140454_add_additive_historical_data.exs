defmodule Scm.Repo.Migrations.AddAdditiveHistoricalData do
  use Ecto.Migration

  def change do
    create table(:additive_historical_data) do
      add(:baseline, :float)
      add(:trend, :float)
      add(:season, :float)
      add(:forecast_type, :string)

      add(:new_historical_data_id, references(:new_historical_data))
      timestamps()
    end
  end
end
