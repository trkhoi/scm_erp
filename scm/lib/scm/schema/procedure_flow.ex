defmodule Scm.Schema.ProcedureFlow do
  use Ecto.Schema
  import Ecto.Changeset

  schema "procedure_flow" do
    field(:procedure, {:array, :string})

    belongs_to(:product, Scm.Schema.Product)
    timestamps()
  end

  @attrs [:product_id, :procedure]

  def changeset(procedure_flow, attrs) do
    procedure_flow
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:product_id)
  end
end
