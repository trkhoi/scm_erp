defmodule Scm.Repo.Migrations.AddTypeMps do
  use Ecto.Migration

  def change do
    alter table(:mps) do
      add(:type, :string)
    end
  end
end
