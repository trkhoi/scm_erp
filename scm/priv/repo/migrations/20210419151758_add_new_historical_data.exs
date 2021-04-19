defmodule Scm.Repo.Migrations.AddNewHistoricalData do
  use Ecto.Migration

  def change do
    create table(:new_historical_data) do
      add(:week, :integer)
      add(:month, :integer)
      add(:year, :integer)
      add(:quantity, :integer)
      add(:description, :string)

      add(:sales_id, references(:sales))

      timestamps()
    end
  end
end
