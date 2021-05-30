defmodule Scm.Schema.Solution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solution" do
    field(:solution, :string)
    field(:type, :string)

    timestamps()
  end

  @attrs [:solution, :type]

  def changeset(solution, attrs) do
    solution
    |> cast(attrs, @attrs)
  end
end
