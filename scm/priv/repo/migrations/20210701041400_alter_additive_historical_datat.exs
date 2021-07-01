defmodule Scm.Repo.Migrations.AlterAdditiveHistoricalDatat do
  use Ecto.Migration

  def change do
    alter table(:new_historical_data) do
      add(:baseline_add, :float)
      add(:trend_add, :float)
      add(:season_add, :float)
      add(:pred_add, :float)
    end
  end
end
