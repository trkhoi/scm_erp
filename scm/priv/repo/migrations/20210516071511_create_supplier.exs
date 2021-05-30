defmodule Scm.Repo.Migrations.CreateSupplier do
  use Ecto.Migration

  def change do
    create table(:status) do
      add(:status, :string)
      add(:info, :string)
      add(:status_name, :string)

      timestamps()
    end

    create table(:solution) do
      add(:solution, :string)
      add(:type, :string)

      timestamps()
    end

    create table(:inventory) do
      add(:type, :string)
      add(:quantity, :float)
      add(:maximum_quantity, :float)

      timestamps()
    end

    create table(:supplier) do
      add(:name, :string)
      add(:info, :string)

      timestamps()
    end
  end
end
