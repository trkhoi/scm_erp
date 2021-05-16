defmodule Scm.Repo.Migrations.Create_DMSupplier do
  use Ecto.Migration

  def change do
    create table(:dm_supplier) do
      add(:criteria_id, references(:criteria))
      add(:supplier_id, references(:supplier))
      add(:dm_id, references(:dm))
      add(:rating, :string)
      add(:rating_code, :string)
      add(:type, :string)
      add(:value, {:array, :float})

      timestamps()
    end
  end
end
