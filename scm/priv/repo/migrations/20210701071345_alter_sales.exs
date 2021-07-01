defmodule Scm.Repo.Migrations.AlterSales do
  use Ecto.Migration

  def change do
    alter table(:sales) do
      add(:unit_price, :float)
      add(:remain_quantity, :float)
      add(:name, :string)
    end
  end
end
