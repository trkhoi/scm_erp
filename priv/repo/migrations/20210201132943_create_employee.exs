defmodule Scm.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employee) do
      add(:productivity, :float)
      add(:working_days, {:array, :integer})
      add(:information, :string)

      timestamps()
    end
  end
end
