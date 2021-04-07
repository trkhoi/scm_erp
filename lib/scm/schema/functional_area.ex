defmodule Scm.Schema.FunctionalArea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functional_area" do
    field(:functional_type, :string)
    field(:name, :string)

    has_many(:functional_area_planning, Scm.Schema.FunctionalAreaPlanning)

    timestamps()
  end

  @attrs [:functional_type, :name]

  def changeset(functional_area, attrs) do
    functional_area
    |> cast(attrs, @attrs)
  end
end
