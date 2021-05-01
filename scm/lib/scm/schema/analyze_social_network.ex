defmodule Scm.Schema.AnalyzeSocialNetwork do
  use Ecto.Schema
  import Ecto.Changeset

  schema "analyze_social_network" do
    field(:name, :string)
    field(:type, :string)
    field(:most_use_product, {:array, :string})
    timestamps()
  end

  @attrs [:most_use_product, :name, :most_use_product]

  def changeset(analyze_social_network, attrs) do
    analyze_social_network
    |> cast(attrs, @attrs)
  end
end
