defmodule Scm.Repo.Migrations.FunctionalAreaFeature do
  use Ecto.Migration

  def change do
    create table(:functional_area_feature) do
      add(:type, :string)
      add(:feature_name, :string)
      add(:functional_area_id, references(:functional_area))

      timestamps()
    end
  end
end
