defmodule Scm.Schema.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field(:name, :string)
    field(:code, :string)
    field(:note, :string)
    field(:price, :float)

    belongs_to(:sales, Scm.Schema.Sales)
    has_many(:sop_component, Scm.Schema.SopComponent)

    timestamps()
  end

  @attrs [:name, :code, :note, :price, :sales_id]

  def changeset(product, attrs) do
    product
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
  end
end
