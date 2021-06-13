defmodule Scm.Repo.Migrations.CreateProductPlan do
  use Ecto.Migration

  def change do
    create table(:product_plan) do
      add(:month, :integer)
      add(:year, :integer)
      add(:quantity, :float)
      add(:product_type, :string)

      timestamps()
    end
  end
end
