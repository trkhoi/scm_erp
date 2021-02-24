defmodule Scm.Repo.Migrations.CreateSop do
  use Ecto.Migration

  def change do
    create table(:sop) do
      add(:month, :integer)
      add(:year, :integer)
      add(:storage, :integer)
      add(:ratio, :float)
      add(:note, :string)

      add(:sales_id, references(:sales))
      timestamps()
    end
  end
end
