defmodule Scm.Schema.Sop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sop" do
    field(:year, :integer)
    field(:month, :integer)
    field(:note, :string)
    field(:capacity, :integer)
    field(:utilization, :float)

    belongs_to(:sales, Scm.Schema.Sales)

    timestamps()
  end

  @attrs [:year, :month, :note, :capacity, :utilization, :sales_id]

  def changeset(sop, attrs) do
    sop
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
  end
end
