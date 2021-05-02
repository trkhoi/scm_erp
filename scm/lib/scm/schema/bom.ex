defmodule Scm.Schema.Bom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bom" do
    field(:information, :string)
    field(:type, :string)
    field(:quantity, :float)
    field(:sharing_id, :string)

    belongs_to(:sales, Scm.Schema.Sales)
    belongs_to(:product, Scm.Schema.Product)
    timestamps()
  end

  @attrs [:product_id, :sales_id, :type, :quantity, :sharing_id, :information]

  def changeset(bom, attrs) do
    bom
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:product_id)
    |> foreign_key_constraint(:sales_id)
  end
end
