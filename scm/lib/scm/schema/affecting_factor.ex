defmodule Scm.Schema.AffectingFactor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "affecting_factor" do
    field(:forecasting_type, {:array, :string})
    field(:type, :string)
    field(:name, :string)
    field(:level, :string)
    belongs_to(:analyze_social_network, Scm.Schema.AnalyzeSocialNetwork)

    timestamps()
  end

  @attrs [:forecasting_type, :type, :name, :level, :analyze_social_network_id]

  def changeset(affecting_factor, attrs) do
    affecting_factor
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:analyze_social_network_id)
  end
end
