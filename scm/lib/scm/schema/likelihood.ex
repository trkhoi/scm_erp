defmodule Scm.Schema.Likelihood do
  use Ecto.Schema
  import Ecto.Changeset

  schema "likelihood" do
    field(:level, :integer)
    field(:likelihood, :string)
    field(:description, :string)

    timestamps()
  end

  @attrs [:likelihood, :description, :level]

  def changeset(likelihood, attrs) do
    likelihood
    |> cast(attrs, @attrs)
  end
end
