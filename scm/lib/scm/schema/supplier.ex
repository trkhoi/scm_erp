defmodule Scm.Schema.Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "supplier" do
    field(:info, :string)
    field(:name, :string)

    timestamps()
  end

  @attrs [:info, :name]

  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, @attrs)
  end
end
