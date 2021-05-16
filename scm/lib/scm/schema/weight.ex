defmodule Scm.Schema.Weight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weight" do
    field(:type, :string)
    field(:rating, :string)
    field(:rating_code, :string)

    timestamps()
  end

  @attrs [:type, :rating, :rating_code]

  def changeset(weight, attrs) do
    weight
    |> cast(attrs, @attrs)
  end
end
