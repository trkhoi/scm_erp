defmodule Scm.Repo.Migrations.FunctionalAreaPlanning do
  use Ecto.Migration

  def change do
    create table(:functional_area_planning) do
      add(:from_time, :utc_datetime)
      add(:to_time, :utc_datetime)
      add(:title, :string)
      add(:type, :string)
      # add(:sop_component_id, references(:sop_component))
      add(:functional_area_id, references(:functional_area))
      add(:sop_id, references(:sop))

      timestamps()
    end
  end
end
