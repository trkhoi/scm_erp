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
    Repo.get(ComponentProduct, id)
  end

  def get_component_with_date(args) do
    product = get_product_from_sales(args)
    {:ok, datetime, 0} = DateTime.from_iso8601(args["applied_date"])
    IO.inspect(datetime.month)
    IO.inspect(datetime.day)
    IO.inspect(datetime.year)

    ComponentProduct
    |> select([c], c)
    |> where(
      [c],
      fragment("date_part('month',?)", c.applied_date) == ^datetime.month and
        fragment("date_part('year',?)", c.applied_date) == ^datetime.year and
        fragment("date_part('day',?)", c.applied_date) == ^datetime.day and
        c.product_id == ^product.id and c.from_time == ^args["from_time"]
    )
    |> Repo.one()
  end

  def get_product_from_sales(args) do
    sales = Repo.get(Sales, args["sales_id"])
    Repo.get_by(Product, code: sales.type)
  end

  def normalize_args(args) do
    product = get_product_from_sales(args)

    %{
      from_time: args["from_time"],
      to_time: args["to_time"],
      applied_date: args["applied_date"],
      component: args["task"],
      product_id: product.id
    }
    |> create_component()
  end
end
