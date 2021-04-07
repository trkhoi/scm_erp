defmodule Scm.Repo.Migrations.AddDateComponent do
  use Ecto.Migration

  def change do
    alter table(:component_product) do
      add(:applied_date, :utc_datetime)
    end
  end
end
