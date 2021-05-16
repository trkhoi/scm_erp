defmodule Scm.Schema.Criteria do
  use Ecto.Schema
  import Ecto.Changeset

  schema "criteria" do
    field(:code, :string)
    field(:name, :string)

    timestamps()
  end

  @attrs [:code, :name]

  def changeset(criteria, attrs) do
    criteria
    |> cast(attrs, @attrs)
  end
end
