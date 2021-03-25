defmodule Scm.Service.ComponentProduct do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{ComponentProduct, Sales, Product}

  def create_component(attrs \\ %{}) do
    %ComponentProduct{}
    |> ComponentProduct.changeset(attrs)
    |> Repo.insert()
  end

  def update_component(%ComponentProduct{} = component_product, attrs) do
    component_product
    |> ComponentProduct.changeset(attrs)
    |> Repo.update()
  end

  def get_component(id) do
    Repo.get(ComponentProduct, id) |> Repo.preload([:product])
  end

  def get_component_with_date(args) do
    product = get_product_from_sales(args)
    {:ok, datetime, 0} = DateTime.from_iso8601(args["from_time"])

    ComponentProduct
    |> select([c], c)
    |> where(
      [c],
      fragment("date_part('month',?)", c.from_time) == ^datetime.month and
        fragment("date_part('year',?)", c.from_time) == ^datetime.year and
        fragment("date_part('day',?)", c.from_time) == ^datetime.day and
        c.product_id == ^product.id
    )
    |> Repo.one()
  end

  def get_product_from_sales(args) do
    sales = Repo.get(Sales, args["sales_id"])
    Repo.get_by(Product, code: sales.type)
  end

  def normalize_args(args) do
    product = get_product_from_sales(args)
    IO.inspect(args)

    %{
      resource_parent: args["resource_id"],
      resource_type: "scheduling",
      from_time: args["from_time"],
      to_time: args["to_time"],
      component: args["task"],
      product_id: product.id
    }
    |> create_component()
  end

  def get_cp(id) do
    Repo.get(ComponentProduct, id) |> Repo.preload([:product])
  end
end
