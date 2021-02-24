defmodule Scm.Repo.Migrations.CreateStorage do
  use Ecto.Migration

  def change do
    create table(:storage) do
      add(:inventory, :integer)
      add(:product_type, :string)
      add(:month, :integer)

      timestamps()
    end
  end
end
