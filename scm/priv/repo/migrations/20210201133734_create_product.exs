defmodule Scm.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add(:name, :string)
      add(:code, :string)
      add(:price, :float)
      add(:note, :string)

      timestamps()
    end
  end
end
