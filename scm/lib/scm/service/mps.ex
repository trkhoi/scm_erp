defmodule Scm.Service.Mps do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{Mps, SalesForecast, ProductPlan, Sales}

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

      acc ++
        [
          %{
            month: month,
            working_days_in_month: @working_days,
            daily_mps: ceil(monthly_pp.quantity / @working_days)
          }
        ]
    end)
  end

  def mps_weekly(mps_daily, args) do
    mps_daily_with_month =
      mps_daily
      |> Enum.filter(fn mps ->
        mps.month == String.to_integer(args["month"])
      end)
      |> List.first()

    IO.inspect(mps_daily_with_month)

    weekly_demand =
      [1, 2, 3, 4, 5]
      |> Enum.reduce([], fn week, accs ->
        case week do
          5 ->
            create_mps(%{
              week: week,
              weekly_demand: mps_daily_with_month.daily_mps,
              month: mps_daily_with_month.month
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
              weekly_demand: mps_daily_with_month.daily_mps * 5,
              month: mps_daily_with_month.month
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
      |> IO.inspect()
  end

  def pp_in_month(product_type, month) do
    ProductPlan
    |> select([pp], pp)
    |> where([pp], pp.product_type == ^product_type and pp.month == ^month)
    |> Repo.one()
  end
end
