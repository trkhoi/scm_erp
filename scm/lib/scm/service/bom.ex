defmodule Scm.Service.Bom do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Product, ProductIngredient, Bom, Sales, Mps, Mrp, IngredientPrice}

  def create_bom_from_sales_id(sales_id) do
    sales = Repo.get(Sales, sales_id)

    pi =
      ProductIngredient
      |> select([pi], pi)
      |> join(:inner, [pi], p in Product, on: pi.product_id == p.id)
      |> where([pi, p], p.code == ^sales.type)
      |> Repo.all()

    _create_bom =
      pi
      |> Enum.map(fn itm ->
        attrs = %{
          type: itm.type,
          product_id: itm.product_id,
          quantity: itm.quantity,
          sales_id: sales_id
        }

        %Bom{}
        |> Bom.changeset(attrs)
        |> Repo.insert()
      end)
  end

  def get_ingredient_price(product) do
    Repo.get_by(IngredientPrice, product: product)
  end

  def get_bom(sales_id) do
    Bom
    |> select([b], b)
    |> where([b], b.sales_id == ^sales_id)
    |> Repo.all()
    |> Enum.map(fn itm ->
      price = get_ingredient_price(itm.type)

      %{
        type: itm.type,
        quantity: itm.quantity,
        id: itm.id,
        price: price.price
      }
    end)
  end

  def get_bom_by_type(ingredient, sales_id) do
    Bom
    |> select([b], b)
    |> where([b], b.type == ^ingredient and b.sales_id == ^sales_id)
    |> Repo.one()
  end

  def get_mps_by_sales_id(month, sales_id) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.sales_id == ^sales_id and mps.month == ^month and not is_nil(mps.week))
    |> Repo.all()
  end

  def create_mrp(mps, args) do
    bom = get_bom_by_type(args["ingredient"], String.to_integer(args["sales_id"]))
    sales_id = String.to_integer(args["sales_id"])

    mps
    |> Enum.map(fn itm ->
      mps_converted = itm.mps * 72 / 500

      gross_requirement = mps_converted * bom.quantity

      lead_times = 2

      itm.week
      |> case do
        1 ->
          val = Enum.at(args["orders"], 0)

          attrs = %{
            month: args["month"],
            ingredient: args["ingredient"],
            week: 1,
            sales_id: String.to_integer(args["sales_id"]),
            gross_requirement: gross_requirement,
            scheduled_receipts: Enum.at(args["orders"], 0),
            planned_receipts: nil,
            on_hand: args["on_hand"] + val - gross_requirement,
            planned_orders: Enum.at(args["orders"], 0 + lead_times)
          }

          %Mrp{}
          |> Mrp.changeset(attrs)
          |> Repo.insert()

        2 ->
          last_mrp = get_mrp(args["month"], 1, sales_id)
          val = Enum.at(args["orders"], 1)

          attrs = %{
            month: args["month"],
            week: 2,
            ingredient: args["ingredient"],
            sales_id: String.to_integer(args["sales_id"]),
            gross_requirement: gross_requirement,
            scheduled_receipts: Enum.at(args["orders"], 1),
            planned_receipts: nil,
            on_hand: last_mrp.on_hand + val - gross_requirement,
            planned_orders: Enum.at(args["orders"], 1 + lead_times)
          }

          %Mrp{}
          |> Mrp.changeset(attrs)
          |> Repo.insert()

        3 ->
          last_mrp = get_mrp(args["month"], 2, sales_id)
          val = Enum.at(args["orders"], 2)

          attrs = %{
            month: args["month"],
            week: 3,
            ingredient: args["ingredient"],
            sales_id: String.to_integer(args["sales_id"]),
            gross_requirement: gross_requirement,
            scheduled_receipts: nil,
            planned_receipts: Enum.at(args["orders"], 2),
            on_hand: last_mrp.on_hand + val - gross_requirement,
            planned_orders: Enum.at(args["orders"], 2 + lead_times)
          }

          %Mrp{}
          |> Mrp.changeset(attrs)
          |> Repo.insert()

        4 ->
          last_mrp = get_mrp(args["month"], 3, sales_id)
          val = Enum.at(args["orders"], 3)

          attrs = %{
            month: args["month"],
            week: 4,
            ingredient: args["ingredient"],
            sales_id: String.to_integer(args["sales_id"]),
            gross_requirement: gross_requirement,
            scheduled_receipts: nil,
            planned_receipts: Enum.at(args["orders"], 3),
            on_hand: last_mrp.on_hand + val - gross_requirement,
            planned_orders: nil
          }

          %Mrp{}
          |> Mrp.changeset(attrs)
          |> Repo.insert()

        5 ->
          last_mrp = get_mrp(args["month"], 4, sales_id)
          val = Enum.at(args["orders"], 4)

          attrs = %{
            month: args["month"],
            week: 5,
            ingredient: args["ingredient"],
            sales_id: String.to_integer(args["sales_id"]),
            gross_requirement: gross_requirement,
            scheduled_receipts: nil,
            planned_receipts: Enum.at(args["orders"], 4),
            on_hand: last_mrp.on_hand + val - gross_requirement,
            planned_orders: nil
          }

          %Mrp{}
          |> Mrp.changeset(attrs)
          |> Repo.insert()
      end
    end)
  end

  def get_mrp(month, week, sales_id) do
    Mrp
    |> select([m], m)
    |> where([m], m.month == ^month and m.week == ^week and m.sales_id == ^sales_id)
    |> Repo.one()
  end

  def get_all_mrp(month, ingredient, sales_id) do
    Mrp
    |> select([m], m)
    |> where([m], m.month == ^month and m.ingredient == ^ingredient and m.sales_id == ^sales_id)
    |> Repo.all()
    |> Enum.map(fn itm ->
      %{
        month: itm.month,
        week: itm.week,
        sales_id: itm.sales_id,
        gross_requirement: itm.gross_requirement,
        scheduled_receipts: itm.scheduled_receipts,
        planned_receipts: itm.planned_receipts,
        on_hand: itm.on_hand,
        planned_orders: itm.planned_orders,
        id: itm.id
      }
    end)
  end
end
