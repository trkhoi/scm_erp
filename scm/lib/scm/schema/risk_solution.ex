defmodule Scm.Schema.RiskSolution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "risk_solution" do
    field(:info, :string)

    belongs_to(:risk, Scm.Schema.Risk)
    belongs_to(:solutions, Scm.Schema.Solutions)
    timestamps()
  end

  @attrs [:risk_id, :solutions_id, :info]

  def changeset(risk_solution, attrs) do
    risk_solution
    |> cast(attrs, @attrs)
    |> foreign_key_constraint(:risk_id)
    |> foreign_key_constraint(:solutions_id)
  end
end
