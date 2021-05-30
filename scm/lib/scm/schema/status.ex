defmodule Scm.Schema.Status do
  use Ecto.Schema
  import Ecto.Changeset

  schema "status" do
    field(:status, :string)
    field(:status_name, :string)
    field(:info, :string)

    timestamps()
  end

  @attrs [:status, :info, :status_name]

  def changeset(status, attrs) do
    status
    |> cast(attrs, @attrs)
  end
end
