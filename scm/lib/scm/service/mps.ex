defmodule Scm.Service.Mps do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Mps, SalesForecast, ProductPlan, Sales, ComponentProduct, Product}

  def create_mps(attrs \\ %{}) do
    %Mps{}
    |> Mps.changeset(attrs)
    |> Repo.insert()
  end

  @working_days 21
  def mps_daily(args) do
    sales = Repo.get(Sales, args["sales_id"])

    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    |> Enum.reduce([], fn month, acc ->
      monthly_pp = pp_in_month(sales.type, month)

      case check_exist_mps(month, args["sales_id"]) do
        n when n > 0 ->
          month_mps = get_exist_mps(month, args["sales_id"])

          acc ++
            [
              %{
                month: month_mps.month,
                working_days_in_month: month_mps.working_days,
                daily_mps: month_mps.mps
              }
            ]

        0 ->
          create_mps(%{
            month: month,
            working_days: @working_days,
            mps: monthly_pp.quantity / @working_days,
            type: "daily",
            sales_id: args["sales_id"]
          })

          acc ++
            [
              %{
                month: month,
                working_days_in_month: @working_days,
                daily_mps: monthly_pp.quantity / @working_days,
                type: "daily"
              }
            ]
      end
    end)
  end

  def check_exist_mps(month, sales_id) do
    Mps
    |> select([mps], count(mps.id))
    |> where([mps], mps.month == ^month and mps.type == "daily" and mps.sales_id == ^sales_id)
    |> Repo.one()
  end

  def get_exist_mps(month, sales_id) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "daily" and mps.sales_id == ^sales_id)
    |> Repo.one()
  end

  def get_exist_mps_weekly(month, sales_id) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "weekly" and mps.sales_id == ^sales_id)
    |> Repo.all()
  end

  def check_exist_mps_weekly(month, sales_id) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "weekly" and mps.sales_id == ^sales_id)
    |> Repo.all()
    |> length()
  end

  def mps_weekly(mps_daily, args) do
    mps_daily_with_month =
      mps_daily
      |> Enum.filter(fn mps ->
        mps.month == String.to_integer(args["month"])
      end)
      |> List.first()

    case check_exist_mps_weekly(args["month"], args["sales_id"]) do
      n when n > 0 ->
        get_exist_mps_weekly(args["month"], args["sales_id"])
        |> Enum.reduce([], fn mps, acc ->
          acc ++
            [
              %{
                sales_id: String.to_integer(args["sales_id"]),
                week: mps.week,
                weekly_demand: mps.mps,
                month: mps.month,
                working_days_in_week: mps.working_days_in_week,
                working_days: mps.working_days,
                monthly_demand: mps_daily_with_month.daily_mps * @working_days
              }
            ]
        end)

      0 ->
        weekly_demand =
          [1, 2, 3, 4, 5]
          |> Enum.reduce([], fn week, accs ->
            case week do
              5 ->
                create_mps(%{
                  week: week,
                  sales_id: String.to_integer(args["sales_id"]),
                  mps: mps_daily_with_month.daily_mps,
                  month: mps_daily_with_month.month,
                  type: "weekly",
                  working_days_in_week: 1,
                  working_days: mps_daily_with_month.working_days_in_month,
                  monthly_demand: mps_daily_with_month.daily_mps * @working_days
                })

                accs ++
                  [
                    %{
                      week: week,
                      sales_id: String.to_integer(args["sales_id"]),
                      weekly_demand: mps_daily_with_month.daily_mps,
                      month: mps_daily_with_month.month,
                      working_days_in_week: 1,
                      working_days: mps_daily_with_month.working_days_in_month,
                      monthly_demand: mps_daily_with_month.daily_mps * @working_days
                    }
                  ]

              _ ->
                create_mps(%{
                  week: week,
                  sales_id: String.to_integer(args["sales_id"]),
                  mps: mps_daily_with_month.daily_mps * 5,
                  month: mps_daily_with_month.month,
                  type: "weekly",
                  working_days_in_week: 5,
                  working_days: mps_daily_with_month.working_days_in_month,
                  monthly_demand: mps_daily_with_month.daily_mps * @working_days
                })

                accs ++
                  [
                    %{
                      week: week,
                      sales_id: String.to_integer(args["sales_id"]),
                      weekly_demand: mps_daily_with_month.daily_mps * 5,
                      month: mps_daily_with_month.month,
                      working_days_in_week: 1,
                      working_days: mps_daily_with_month.working_days_in_month,
                      monthly_demand: mps_daily_with_month.daily_mps * @working_days
                    }
                  ]
            end
          end)
    end
  end

  def pp_in_month(product_type, month) do
    ProductPlan
    |> select([pp], pp)
    |> where([pp], pp.product_type == ^product_type and pp.month == ^month)
    |> Repo.one()
  end

  def detail_schedule(args) do
    Repo.get(Sales, args["sales_id"])

    # Mps
    # |> select([mps], mps)
    # |> where([mps], mps.month == 3 and mps.type == "daily")
    # |> preload([:sales])
    # |> Repo.one()
  end

  def normalize_schedule(sales) do
    product = Repo.get_by(Product, code: sales.type)

    component_product =
      ComponentProduct
      |> select([cp], cp)
      |> where([cp], cp.product_id == ^product.id)
      |> preload([:product])
      |> Repo.all()
  end

  def mps(args) do
    Repo.all(ProductPlan)
    |> Enum.group_by(fn x -> x.product_type end)
    |> Enum.map(fn {_k, v} ->
      product = List.first(v)

      quantity =
        v
        |> IO.inspect()
        |> Enum.filter(fn x ->
          x.month == String.to_integer(args["month"])
        end)
        |> List.first()

      # |> Enum.reduce([], fn x, acc ->
      #   acc ++ [x.quantity]
      # end)
      # |> Enum.sum()

      %{
        product: product.name,
        quantity: quantity.quantity,
        working_days_in_month: @working_days,
        status: map_status(quantity.quantity)
      }
    end)
  end

  def map_status(quantity) when quantity > 0 and quantity <= 500 do
    "very low"
  end

  def map_status(quantity) when quantity > 500 and quantity <= 1000 do
    "low"
  end

  def map_status(quantity) when quantity >= 1000 and quantity < 1500 do
    "medium"
  end

  def map_status(quantity) when quantity >= 1500 and quantity < 2000 do
    "high"
  end

  def map_status(quantity) when quantity >= 2000 do
    "very high"
  end
end
