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

      case check_exist_mps(month) do
        n when n > 0 ->
          month_mps = get_exist_mps(month)

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
            mps: ceil(monthly_pp.quantity / @working_days),
            type: "daily",
            sales_id: 1
          })

          acc ++
            [
              %{
                month: month,
                working_days_in_month: @working_days,
                daily_mps: ceil(monthly_pp.quantity / @working_days),
                type: "daily"
              }
            ]
      end
    end)
  end

  def check_exist_mps(month) do
    Mps
    |> select([mps], count(mps.id))
    |> where([mps], mps.month == ^month and mps.type == "daily")
    |> Repo.one()
  end

  def get_exist_mps(month) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "daily")
    |> Repo.one()
  end

  def get_exist_mps_weekly(month) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "weekly")
    |> Repo.all()
  end

  def check_exist_mps_weekly(month) do
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == ^month and mps.type == "weekly")
    |> Repo.all()
    |> length()
  end

  def mps_weekly(mps_daily, args) do
    mps_daily_with_month =
      mps_daily
      |> Enum.filter(fn mps ->
        mps.month == String.to_integer(args["month"])
      end)
      |> IO.inspect()
      |> List.first()

    case check_exist_mps_weekly(args["month"]) do
      n when n > 0 ->
        get_exist_mps_weekly(args["month"])
        |> Enum.reduce([], fn mps, acc ->
          acc ++
            [
              %{
                week: mps.week,
                weekly_demand: mps.mps,
                month: mps.month
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
                  mps: mps_daily_with_month.daily_mps,
                  month: mps_daily_with_month.month,
                  type: "weekly"
                })

                accs ++
                  [
                    %{
                      week: week,
                      weekly_demand: mps_daily_with_month.daily_mps,
                      month: mps_daily_with_month.month
                    }
                  ]

              _ ->
                create_mps(%{
                  week: week,
                  mps: mps_daily_with_month.daily_mps * 5,
                  month: mps_daily_with_month.month,
                  type: "weekly"
                })

                accs ++
                  [
                    %{
                      week: week,
                      weekly_demand: mps_daily_with_month.daily_mps * 5,
                      month: mps_daily_with_month.month
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
    Mps
    |> select([mps], mps)
    |> where([mps], mps.month == 3 and mps.type == "daily")
    |> preload([:sales])
    |> Repo.one()
  end

  def normalize_schedule(schedule) do
    product = Repo.get_by(Product, code: schedule.sales.type)

    component_product =
      ComponentProduct
      |> select([cp], cp)
      |> where([cp], cp.product_id == ^product.id)
      |> preload([:product])
      |> Repo.all()
  end
end
