defmodule Scm.Schema.ComponentProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "component_product" do
    field(:type, :string)
    field(:component, :string)
    field(:from_time, :string)
    field(:to_time, :string)

    belongs_to(:product, Scm.Schema.Product)
    timestamps()
  end

  @attrs [:type, :component, :from_time, :to_time, :product_id]

  def changeset(component_product, attrs) do
    component_product
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:product_id)
  end
end
