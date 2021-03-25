defmodule Scm.Schema.ComponentProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "component_product" do
    field(:type, :string)
    field(:component, :string)
    field(:from_time, :utc_datetime)
    field(:to_time, :utc_datetime)
    field(:resource_type, :string)
    field(:resource_parent, :integer)
    field(:applied_date, :utc_datetime)

    belongs_to(:product, Scm.Schema.Product)
    timestamps()
  end

  @attrs [
    :type,
    :component,
    :from_time,
    :to_time,
    :product_id,
    :applied_date,
    :resource_type,
    :resource_parent
  ]

  def changeset(component_product, attrs) do
    component_product
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:product_id)
  end
end
