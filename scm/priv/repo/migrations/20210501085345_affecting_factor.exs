defmodule Scm.Repo.Migrations.AffectingFactor do
  use Ecto.Migration

  def change do
    create table(:analyze_social_network) do
      add(:name, :string)
      add(:type, :string)
      add(:most_use_product, {:array, :string})
      timestamps()
    end

    create table(:affecting_factor) do
      add(:forecasting_type, {:array, :string})
      add(:type, :string)
      add(:name, :string)
      add(:level, :string)
      add(:analyze_social_network_id, references(:analyze_social_network))
      timestamps()
    end
  end
end
