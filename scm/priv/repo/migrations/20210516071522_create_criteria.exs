defmodule Scm.Repo.Migrations.CreateCriteria do
  use Ecto.Migration

  def change do
    create table(:criteria) do
      add(:name, :string)
      add(:code, :string)
      timestamps()
    end
  end
end
