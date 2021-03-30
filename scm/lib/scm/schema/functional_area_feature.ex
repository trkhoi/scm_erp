defmodule Scm.Schema.FunctionalAreaFeature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functional_area_feature" do
    field(:type, :string)
    field(:feature_name, :string)

    belongs_to(:functional_area, Scm.Schema.FunctionalArea)

    timestamps()
  end

  @attrs [:functional_area_id, :type, :feature_type]

  def changeset(functional_area_feature, attrs) do
    functional_area_feature
    |> cast(attrs, @attrs)
  end
end
