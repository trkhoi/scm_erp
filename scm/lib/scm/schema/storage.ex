defmodule Scm.Schema.Storage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage" do
    field(:inventory, :integer)
    field(:product_type, :string)
    field(:month, :integer)

    timestamps()
  end

  @attrs [:inventory, :product_type, :month]

  def changeset(storage, attrs) do
    storage
    |> cast(attrs, @attrs)
  end
end
