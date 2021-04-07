defmodule Scm.Repo.Migrations.CreateSop do
  use Ecto.Migration

  def change do
    create table(:sop) do
      add(:month, :integer)
      add(:year, :integer)
      add(:capacity, :integer)
      add(:utilization, :float)
      add(:note, :string)
      add(:resource_type, :string)

      add(:sales_id, references(:sales))
      add(:sales_forecast_id, references(:sales_forecast))
      timestamps()
    end
  end
end
