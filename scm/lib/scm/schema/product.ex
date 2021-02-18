defmodule Scm.Schema.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field(:name, :string)
    field(:code, :string)
    field(:note, :string)
    field(:price, :float)

    timestamps()
  end

  @attrs [:name, :code, :note, :price]

  def changeset(product, attrs) do
    product
    |> cast(attrs, @attrs)
  end
end
