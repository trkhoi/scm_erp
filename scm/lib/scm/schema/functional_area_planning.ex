defmodule Scm.Schema.FunctionalAreaPlanning do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functional_area_planning" do
    field(:from_time, :utc_datetime)
    field(:to_time, :utc_datetime)

    belongs_to(:functional_area, Scm.Schema.FunctionalArea)
    belongs_to(:sop_component_id, Scm.Schema.SopComponent)

    timestamps()
  end

  @attrs [:functional_area_id, :from_time, :to_time, :sop_component_id]

  def changeset(functional_area_planning, attrs) do
    functional_area_planning
    |> cast(attrs, @attrs)
  end
end
