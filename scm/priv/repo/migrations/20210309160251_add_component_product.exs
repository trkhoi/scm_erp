defmodule Scm.Repo.Migrations.AddComponentProduct do
  use Ecto.Migration

  def change do
    create table(:component_product) do
      add(:type, :string)
      add(:component, :string)
      add(:from_time, :string)
      add(:to_time, :string)
      add(:product_id, references(:product))
      timestamps()
    end
  end
end
