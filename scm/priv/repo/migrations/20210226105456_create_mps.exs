defmodule Scm.Repo.Migrations.CreateMps do
  use Ecto.Migration

  def change do
    create table(:mps) do
      add(:month, :integer)
      add(:year, :integer)
      add(:week, :integer)
      add(:working_days, :integer)
      add(:mps, :float)

      add(:sales_id, references(:sales))
      timestamps()
    end
  end
end
