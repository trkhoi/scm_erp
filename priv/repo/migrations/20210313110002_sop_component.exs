defmodule Scm.Repo.Migrations.SopComponent do
  use Ecto.Migration

  def change do
    create table(:sop_component) do
      add(:product_id, references(:product))
      add(:sop_id, references(:sop))
      add(:from_time, :utc_datetime)
      add(:to_time, :utc_datetime)
      add(:component, :string)
      add(:quantity, :integer)
      add(:type, :string)

      timestamps()
    end
  end
end
