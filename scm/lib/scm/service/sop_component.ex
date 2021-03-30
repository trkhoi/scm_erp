defmodule Scm.Service.SopComponent do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{SopComponent, Product, Sop}

  def get_product_by_id(product_id) do
    Repo.get(Product, product_id)
  end

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
      sc.product_id == ^args["product_id"] and sc.id == ^args["id"]
    )
    |> preload([:sop])
    |> Repo.one()
  end

  def all_sop_component(sales_id) do
    SopComponent
    |> select([sc], sc)
    |> join(:inner, [sc], p in Product, on: sc.product_id == p.id)
    |> where([sc, p], p.sales_id == ^sales_id)
    |> Repo.all()
  end
end
