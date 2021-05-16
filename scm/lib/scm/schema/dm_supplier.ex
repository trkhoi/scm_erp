defmodule Scm.Schema.DmSupplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dm_supplier" do
    field(:type, :string)
    field(:rating, :string)
    field(:rating_code, :string)
    field(:value, {:array, :float})

    belongs_to(:supplier, Scm.Schema.Supplier)
    belongs_to(:criteria, Scm.Schema.Sop)
    belongs_to(:dm, Scm.Schema.Dm)

    timestamps()
  end

  @attrs [:supplier_id, :criteria_id, :dm_id, :type, :rating, :rating_code, :value]

  def changeset(dm_supplier, attrs) do
    dm_supplier
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:supplier_id)
    |> foreign_key_constraint(:criteria_id)
    |> foreign_key_constraint(:dm_id)
  end
end
