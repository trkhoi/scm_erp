defmodule Scm.Schema.MatrixFuzzy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "matrix_fuzzy" do
    field(:type, :string)
    field(:aggregate_value, {:array, :float})
    field(:nor_aggregate_value, {:array, :float})
    field(:fnis, :float)
    field(:fpis, :float)

    belongs_to(:supplier, Scm.Schema.Supplier)
    belongs_to(:criteria, Scm.Schema.Criteria)

    timestamps()
  end

  @attrs [:supplier_id, :criteria_id, :aggregate_value, :type, :nor_aggregate_value, :fnis, :fpis]

  def changeset(matrix_fuzzy, attrs) do
    matrix_fuzzy
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:supplier_id)
    |> foreign_key_constraint(:criteria_id)
  end
end
