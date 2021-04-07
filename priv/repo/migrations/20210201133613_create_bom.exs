defmodule Scm.Repo.Migrations.CreateBom do
  use Ecto.Migration

  def change do
    create table(:bom) do
      add(:type, :string)
      add(:quantity, :integer)
      add(:information, :string)
      add(:sharing_id, :string)

      timestamps()
    end
  end
end
