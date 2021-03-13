defmodule Scm.Service.SopComponent do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{SopComponent, Product, Sop}

  def create_sop_component(attrs \\ %{}) do
    %SopComponent{}
    |> SopComponent.changeset(attrs)
    |> Repo.insert()
  end

  def update_sop_component(%SopComponent{} = sop_component, attrs) do
    sop_component
    |> SopComponent.changeset(attrs)
    |> Repo.update()
  end

  def get_sop_component(args) do
    SopComponent
    |> select([sc], sc)
    |> where(
      [sc],
      sc.sales_id == ^args["sales_id"] and sc.sop_id == ^args["sop_id"] and sc.id == ^args["id"]
    )
    |> Repo.one()
  end

  def all_sop_component(args) do
    SopComponent
    |> select([sc], sc)
    |> where([sc], sc.sales_id == ^args["sales_id"] and sc.sop_id == ^args["sop_id"])
    |> Repo.all()
  end
end
