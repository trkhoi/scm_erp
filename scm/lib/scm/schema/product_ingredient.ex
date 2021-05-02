defmodule Scm.Schema.ProductIngredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_ingredient" do
    field(:name, :string)
    field(:type, :string)
    field(:quantity, :float)

    belongs_to(:product, Scm.Schema.Product)
    timestamps()
  end

  @attrs [:product_id, :name, :type, :quantity]

  def changeset(product_ingredient, attrs) do
    product_ingredient
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:product_id)
  end
end
