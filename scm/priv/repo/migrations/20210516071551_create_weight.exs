defmodule Scm.Repo.Migrations.CreateWeight do
  use Ecto.Migration

  def change do
    create table(:weight) do
      add(:type, :string)
      add(:rating, :string)
      add(:rating_code, :string)

      timestamps()
    end
  end
end
