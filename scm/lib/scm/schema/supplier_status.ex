defmodule Scm.Schema.SupplierStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "supplier_status" do
    field(:note, :string)

    belongs_to(:status, Scm.Schema.Status)
    belongs_to(:supplier, Scm.Schema.Supplier)
    timestamps()
  end

  @attrs [:status_id, :supplier_id, :note]

  def changeset(supplier_status, attrs) do
    supplier_status
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:status_id)
    |> foreign_key_constraint(:supplier_id)
  end
end
