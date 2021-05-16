defmodule Scm.Repo.Migrations.CreateSupplier do
  use Ecto.Migration

  def change do
    create table(:supplier) do
      add(:name, :string)
      add(:info, :string)

      timestamps()
    end
  end
end
