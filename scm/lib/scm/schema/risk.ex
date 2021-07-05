defmodule Scm.Schema.Risk do
  use Ecto.Schema
  import Ecto.Changeset

  schema "risk" do
    field(:risk, :string)
    field(:status, :string)

    belongs_to(:consequence, Scm.Schema.Consequence)
    belongs_to(:likelihood, Scm.Schema.Likelihood)
    timestamps()
  end

  @attrs [:consequence_id, :likelihood_id, :risk, :status]

  def changeset(risk, attrs) do
    risk
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:likelihood_id)
    |> foreign_key_constraint(:consequence_id)
  end
end
