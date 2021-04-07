defmodule Scm.Repo.Migrations.AddShipmentHistorical do
  use Ecto.Migration

  def change do
    alter table(:historical_data) do
      add(:shipment, :integer)
    end
  end
end
