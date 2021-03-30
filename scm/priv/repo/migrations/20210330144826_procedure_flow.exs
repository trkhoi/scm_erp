defmodule Scm.Repo.Migrations.ProcedureFlow do
  use Ecto.Migration

  def change do
    create table(:procedure_flow) do
      add(:product_id, references(:product))
      add(:procedure, {:array, :string})

      timestamps()
    end
  end
end
