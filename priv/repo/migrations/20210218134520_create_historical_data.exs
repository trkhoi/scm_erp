defmodule Scm.Repo.Migrations.CreateHistoricalData do
  use Ecto.Migration

  def change do
    create table(:historical_data) do
      add(:month, :integer)
      add(:quantity, :integer)
      add(:description, :string)

      add(:sales_id, references(:sales))
      timestamps()
    end
  end
end
