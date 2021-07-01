defmodule Scm.Schema.IngredientPrice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredient_price" do
    field(:price, :float)
    field(:product, :string)

    timestamps()
  end

  @attrs [:price, :product]

  def changeset(ingredient_price, attrs) do
    ingredient_price
    |> cast(attrs, @attrs)
  end
end
