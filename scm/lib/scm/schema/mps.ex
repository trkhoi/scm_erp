defmodule Scm.Schema.Mps do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mps" do
    field(:month, :integer)
    field(:year, :integer)
    field(:week, :integer)
    field(:working_days, :integer)
    field(:mps, :float)
    field(:type, :string)

    belongs_to(:sales, Scm.Schema.Sales)
    timestamps()
  end

  @attrs [:month, :year, :week, :sales_id, :mps, :working_days, :type]

  def changeset(historical_data, attrs) do
    historical_data
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:sales_id)
  end
end
