defmodule Scm.Repo.Migrations.AlterProductPlan do
  use Ecto.Migration

  def change do
    alter table(:product_plan) do
      add(:name, :string)
    end
  end
end
