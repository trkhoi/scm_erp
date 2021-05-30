defmodule Scm.Schema.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventory" do
    field(:maximum_quantity, :float)
    field(:type, :string)
    field(:quantity, :float)

    timestamps()
  end

  @attrs [:maximum_quantity, :type, :quantity]

  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, @attrs)
  end
end
