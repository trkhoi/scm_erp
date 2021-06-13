defmodule Scm.Service.Replan do
  import Ecto.Query, warn: false
  alias Scm.Repo
  alias Ecto.Changeset
  alias Scm.Service.Sop, as: SopService
  alias Scm.Service.ProductPlan, as: ProductPlanService
  alias Scm.Service.Mps, as: MpsService
  alias Scm.Service.SalesForecast, as: SalesForecastService

  alias Scm.Schema.{Solutions, Likelihood, Consequence, Risk, RiskSolution, ProductPlan, NewBom}

  def get_risk() do
    Risk
    |> select([r], r)
    |> preload([:likelihood, :consequence])
    |> Repo.all()
    |> Enum.map(fn itm ->
      rating = itm.likelihood.level * itm.consequence.level

      %{
        id: itm.id,
        risk: itm.risk,
        rating: rating,
        description: evaluate_description(rating)
      }
    end)
  end

  def evaluate_description(rating) when rating >= 1 and rating <= 4 do
    "Low"
  end

  def evaluate_description(rating) when rating >= 5 and rating <= 8 do
    "Moderate"
  end

  def evaluate_description(rating) when rating >= 9 and rating <= 12 do
    "High"
  end

  def evaluate_description(rating) when rating >= 13 and rating <= 16 do
    "Severe"
  end

  def get_solution() do
    Solutions
    |> select([s], s)
    |> Repo.all()
    |> Enum.map(fn itm ->
      %{
        id: itm.id,
        solution: itm.solution
      }
    end)
  end

  def gen_risk_solution(solution_id, risk_id) do
    solution = Repo.get(Solutions, solution_id)
    risk = Repo.get(Risk, risk_id)
    handle_solution(solution.type)
  end

  def update_product_plan() do
    ProductPlan
    |> select([pp], pp)
    |> Repo.all()
    |> Enum.map(fn itm ->
      ProductPlanService.update_pp(itm, %{
        quantity: itm.quantity - itm.quantity * Enum.random(10..20) / 100
      })
    end)
  end

  def deduct_bom() do
    Repo.all(NewBom)
    |> Enum.map(fn itm ->
      %{
        id: itm.id,
        product: itm.product,
        material: itm.material,
        quantity: itm.quantity - itm.quantity * Enum.random(10..20) / 100
      }
    end)
  end

  def handle_solution(type) when type == "human" do
    %{
      message:
        "Production plan do not change. Please contact with manager to solve funding problem"
    }
  end

  def handle_solution(type) when type == "mechanical" do
    # update product plan
    update_product_plan()

    args = %{
      "sales_id" => 1
    }

    # recalculate salesforecast
    sf =
      SalesForecastService.get_additive_sf(args["sales_id"])
      |> Enum.map(fn itm ->
        %{
          month: itm.month,
          week: itm.week,
          forecast_value: itm.forecast_value
        }
      end)

    # recalculate sop
    forecast_type = "additive"
    sop = SopService.sop_estimate_enhance(args, forecast_type)
    mess = SopService.check_utilization(sop)

    # recalculate demand

    daily_demand = MpsService.mps_daily(args)
    # recalculate bom
    bom = deduct_bom()

    %{
      sales_forecast: sf,
      sop: sop,
      daily_demand: daily_demand,
      bom: bom
    }
  end
end
