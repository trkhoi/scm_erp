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
  end
end
