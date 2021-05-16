defmodule Scm.Repo.Migrations.Create_DM do
  use Ecto.Migration

  def change do
    create table(:dm) do
      add(:info, :string)
      add(:name, :string)

      timestamps()
    end
  end
end
