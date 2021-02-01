defmodule Scm.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:session) do
      add(:information, :string)
      add(:sharing_id, :string)
      add(:quantity, :float)

      add(:bom_id, references("bom"))
      add(:product_id, references("product"))

      timestamps()
    end
  end
end
