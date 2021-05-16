defmodule Scm.Repo.Migrations.CreateMatrixFuzzy do
  use Ecto.Migration

  def change do
    create table(:matrix_fuzzy) do
      add(:criteria_id, references(:criteria))
      add(:supplier_id, references(:supplier))

      add(:type, :string)
      add(:aggregate_value, {:array, :float})
      add(:nor_aggregate_value, {:array, :float})
      add(:fnis, :float)
      add(:fpis, :float)

      timestamps()
    end
  end
end
