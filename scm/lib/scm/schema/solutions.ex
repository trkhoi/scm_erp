defmodule Scm.Schema.Solutions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solutions" do
    field(:solution, :string)
    field(:info, :string)
    field(:type, :string)
    timestamps()
  end

  @attrs [:solution, :info, :type]

  def changeset(solutions, attrs) do
    solutions
    |> cast(attrs, @attrs)
  end
end
