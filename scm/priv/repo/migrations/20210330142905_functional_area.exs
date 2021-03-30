defmodule Scm.Repo.Migrations.FunctionalArea do
  use Ecto.Migration

  def change do
    create table(:functional_area) do
      add(:functional_type, :string)
      add(:name, :string)

      timestamps()
    end
  end
end
