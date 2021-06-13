defmodule Scm.Schema.ProductPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_plan" do
    field(:month, :integer)
    field(:year, :integer)
    field(:quantity, :float)
    field(:product_type, :string)

    timestamps()
  end

  @attrs [:month, :year, :quantity, :product_type]

  def changeset(product_plan, attrs) do
    product_plan
    |> cast(attrs, [:month, :year, :quantity, :product_type])
  end
end
