defmodule Scm.Repo.Migrations.ResourceType do
  use Ecto.Migration

  def change do
    alter table(:component_product) do
      add(:resource_type, :string)
      add(:resource_parent, :integer)
    end

    alter table(:sop_component) do
      add(:resource_type, :string)
      add(:resource_parent, :integer)
    end
  end
end
