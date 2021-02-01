defmodule Scm.Repo.Migrations.CreateForcasting do
  use Ecto.Migration

  def change do
    create table(:forecasting) do
      add(:month, :integer)
      add(:last_quantity, :float)
      add(:last_promotion, :float)
      add(:growth, :float)
      add(:promotion, :float)
      add(:foreacast, :float)

      add(:customer_id, references("customer"))

      timestamps()
    end
  end
end
