defmodule Scm.Repo.Migrations.AddComponentProduct do
  use Ecto.Migration

  def change do
    create table(:component_product) do
      add(:type, :string)
      add(:component, :string)
      add(:from_time, :utc_datetime)
      add(:to_time, :utc_datetime)
      add(:product_id, references(:product))
      timestamps()
    end
  end
end
