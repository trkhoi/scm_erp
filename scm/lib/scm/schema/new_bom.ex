defmodule Scm.Schema.NewBom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "new_bom" do
    field(:product, :string)
    field(:material, :string)
    field(:quantity, :float)

    timestamps()
  end

  @attrs [:quantity, :material, :product]

  def changeset(new_bom, attrs) do
    new_bom
    |> cast(attrs, @attrs)
  end
end
