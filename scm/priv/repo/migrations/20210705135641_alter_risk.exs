defmodule Scm.Repo.Migrations.AlterRisk do
  use Ecto.Migration

  def change do
    alter table(:risk) do
      add(:status, :string)
    end
  end
end
