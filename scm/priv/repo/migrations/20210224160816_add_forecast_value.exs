defmodule Scm.Repo.Migrations.AddForecastValue do
  use Ecto.Migration

  def change do
    alter table(:sales_forecast) do
      add(:forecast_value, :float)
      add(:sales_id, references(:sales))
    end
  end
end
