defmodule Scm.Repo.Migrations.CreateHistoricalData do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add(:year, :integer)
      add(:title, :string)
      add(:description, :string)
      add(:type, :string)

      timestamps()
    end

    create table(:historical_data) do
      add(:month, :integer)
      add(:quantity, :integer)
      add(:description, :string)

      add(:sales_id, references(:sales))
      timestamps()
    end
  end
end
