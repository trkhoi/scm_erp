defmodule Scm.Schema.Consequence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "consequence" do
    field(:level, :integer)
    field(:consequence, :string)
    field(:description, :string)

    timestamps()
  end

  @attrs [:consequence, :description, :level]

  def changeset(consequence, attrs) do
    consequence
    |> cast(attrs, @attrs)
  end
end
