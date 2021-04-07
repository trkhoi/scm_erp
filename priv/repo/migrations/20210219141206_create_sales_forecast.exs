defmodule Scm.Repo.Migrations.CreateSalesForecast do
  use Ecto.Migration

  def change do
    create table(:sales_forecast) do
      add(:product_type, :string)
      add(:growth, :float)
      add(:promotion, :integer)
      add(:month, :integer)
      add(:year, :integer)

      timestamps()
    end
  end
end
