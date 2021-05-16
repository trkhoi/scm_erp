defmodule Scm.Schema.Dm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dm" do
    field(:info, :string)
    field(:name, :string)

    timestamps()
  end

  @attrs [:info, :name]

  def changeset(dm, attrs) do
    dm
    |> cast(attrs, @attrs)
  end
end
