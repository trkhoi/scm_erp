defmodule Scm.Schema.FunctionalAreaPlanning do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functional_area_planning" do
    field(:from_time, :utc_datetime)
    field(:to_time, :utc_datetime)
    field(:title, :string)
    field(:type, :string)

    belongs_to(:functional_area, Scm.Schema.FunctionalArea)
    belongs_to(:sop, Scm.Schema.Sop)

    timestamps()
  end

  @attrs [:functional_area_id, :from_time, :to_time, :title, :type, :sop_id]

  def changeset(functional_area_planning, attrs) do
    functional_area_planning
    |> cast(attrs, @attrs)
  end
end
