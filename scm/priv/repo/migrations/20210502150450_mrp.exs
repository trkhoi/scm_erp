defmodule Scm.Repo.Migrations.Mrp do
  use Ecto.Migration

  def change do
    create table(:mrp) do
      add(:gross_requirement, :float)
      add(:scheduled_receipts, :float)
      add(:planned_receipts, :float)
      add(:on_hand, :float)
      add(:planned_orders, :float)
      add(:sales_id, references(:sales))
      add(:mps_id, references(:mps))
      add(:month, :integer)
      add(:week, :integer)
      add(:ingredient, :string)
      timestamps()
    end
  end
end
