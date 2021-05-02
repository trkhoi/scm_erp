defmodule Scm.Schema.Mrp do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mrp" do
    field(:gross_requirement, :float)
    field(:scheduled_receipts, :float)
    field(:planned_orders, :float)
    field(:planned_receipts, :float)
    field(:on_hand, :float)
    field(:month, :integer)
    field(:week, :integer)
    field(:ingredient, :string)

    belongs_to(:sales, Scm.Schema.Sales)
    belongs_to(:mps, Scm.Schema.Mps)
    timestamps()
  end

  @attrs [
    :month,
    :week,
    :mps_id,
    :sales_id,
    :gross_requirement,
    :scheduled_receipts,
    :planned_receipts,
    :on_hand,
    :planned_orders,
    :ingredient
  ]

  def changeset(mrp, attrs) do
    mrp
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:mps_id)
    |> foreign_key_constraint(:sales_id)
  end
end
