defmodule Scm.Repo.Migrations.AddSupplierStatus do
  use Ecto.Migration

  def change do
    create table(:supplier_status) do
      add(:status_id, references(:status))
      add(:supplier_id, references(:supplier))
      add(:note, :string)

      timestamps()
    end
  end
end
