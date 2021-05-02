defmodule Scm.Repo.Migrations.ProductIngredient do
  use Ecto.Migration

  def change do
    create table(:product_ingredient) do
      add(:name, :string)
      add(:type, :string)
      add(:product_id, references(:product))
      add(:quantity, :float)
      timestamps()
    end
  end
end
