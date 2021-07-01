defmodule Scm.Repo.Migrations.CreateIngredientPrice do
  use Ecto.Migration

  def change do
    create table(:ingredient_price) do
      add(:product, :string)
      add(:price, :float)
      timestamps()
    end
  end
end
