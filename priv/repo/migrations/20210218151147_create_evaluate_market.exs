defmodule Scm.Repo.Migrations.CreateEvaluateMarket do
  use Ecto.Migration

  def change do
    create table(:market) do
      add(:company, :string)
      add(:code, :string)
      add(:product_type, :string)
      add(:price, :float)
      timestamps()
    end
  end
end
