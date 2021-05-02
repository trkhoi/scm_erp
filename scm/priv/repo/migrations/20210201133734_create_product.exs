defmodule Scm.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add(:year, :integer)
      add(:title, :string)
      add(:description, :string)
      add(:type, :string)

      timestamps()
    end

    create table(:product) do
      add(:name, :string)
      add(:code, :string)
      add(:price, :float)
      add(:note, :string)
      add(:sales_id, references(:sales))
      add(:feature, :string)

      timestamps()
    end

    create table(:bom) do
      add(:type, :string)
      add(:quantity, :float)
      add(:information, :string)
      add(:sharing_id, :string)
      add(:sales_id, references(:sales))
      add(:product_id, references(:product))

      timestamps()
    end
  end
end
