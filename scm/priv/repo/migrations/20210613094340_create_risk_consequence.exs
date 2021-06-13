defmodule Scm.Repo.Migrations.CreateRiskConsequence do
  use Ecto.Migration

  def change do
    create table(:likelihood) do
      add(:likelihood, :string)
      add(:level, :integer)
      add(:description, :string)

      timestamps()
    end

    create table(:consequence) do
      add(:level, :integer)
      add(:consequence, :string)
      add(:description, :string)

      timestamps()
    end

    create table(:risk) do
      add(:risk, :string)
      add(:consequence_id, references(:consequence))
      add(:likelihood_id, references(:likelihood))

      timestamps()
    end

    create table(:solutions) do
      add(:solution, :string)
      add(:info, :string)
      add(:type, :string)

      timestamps()
    end

    create table(:risk_solution) do
      add(:solutions_id, references(:solutions))
      add(:risk_id, references(:risk))
      add(:info, :string)

      timestamps()
    end
  end
end
