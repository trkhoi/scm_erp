defmodule Scm.Repo.Migrations.AddNewBom do
  use Ecto.Migration

  def change do
    create table(:new_bom) do
      add(:product, :string)
      add(:material, :string)
      add(:quantity, :float)

      timestamps()
    end
  end
end
