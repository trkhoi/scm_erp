defmodule Scm.Schema.SopComponent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sop_component" do
    field(:from_time, :utc_datetime)
    field(:to_time, :utc_datetime)
    field(:component, :string)
    field(:quantity, :integer)
    field(:resource_type, :string)
    field(:resource_parent, :integer)

    belongs_to(:sales, Scm.Schema.Sales)
    belongs_to(:sop, Scm.Schema.Sop)
    timestamps()
  end

  @attrs [
    :from_time,
    :to_time,
    :component,
    :quantity,
    :sop_id,
    :sales_id,
    :resource_parent,
    :resource_type
  ]

  def changeset(sop_component, attrs) do
    sop_component
    |> cast(attrs, @attrs)
  end
end
