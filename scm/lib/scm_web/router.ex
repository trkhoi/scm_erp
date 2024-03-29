defmodule ScmWeb.Router do
  use ScmWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(CORSPlug, origin: "http://localhost:3000")
    plug(:accepts, ["json"])
  end

  scope "/api/v1", ScmWeb do
    pipe_through(:api)

    scope "/supplier" do
      post("/aggregate", FuzzyController, :gen_aggregate_fuzzy)
      post("/fpis_fnis", FuzzyController, :gen_fnis_fpis)
      get("/ranking", FuzzyController, :ranking_criteria)

      # handle supplier collapse
      get("/status", SupplierController, :supplier_status)
      get("/solution", SupplierController, :solution)
      get("/handle_issue", SupplierController, :handle_issue)
    end

    scope "/replan" do
      get("/risk", ReplanController, :risk)
      get("/solutions", ReplanController, :solutions)
      post("/handle", ReplanController, :gen_risk_solution)
    end

    get("/product/:product_id/sop_componnent/", SopComponentController, :index)
    get("/product/:product_id/sop_componnent/:id", SopComponentController, :show)
    post("/product/:product_id/sop_componnent/", SopComponentController, :create)
    put("/product/:product_id/sop_componnent/:id", SopComponentController, :update)

    get("/functional_planning", FunctionalAreaController, :index)
    get("/functional_planning/:id", FunctionalAreaController, :show)
    post("/functional_planning", FunctionalAreaController, :create)
    put("/functional_planning/:id", FunctionalAreaController, :update)

    resources "/functional_planning", FunctionalAreaController, only: [:index, :create, :update] do
    end

    get("/historical_data", SalesController, :sales_report)
    get("/finance_statstic", SalesController, :finance_statistic)
    get("/compare_market", SalesController, :evaluate_market)

    get("/demand", MpsController, :mps)
    get("/order", BomController, :order)

    scope "/sales" do
      get("/:sales_id", SalesController, :show)

      get("/:sales_id/demand_daily", MpsController, :daily_mps)
      get("/:sales_id/demand_weekly", MpsController, :weekly_mps)
      post("/:sales_id/sop", SopController, :sop)
      put("/:sales_id/sop/", SopController, :update_sop)

      post("/:sales_id/bom", BomController, :create)
      get("/:sales_id/bom", BomController, :index)
      post("/:sales_id/mrp", BomController, :create_mrp)
      get("/:sales_id/mrp", BomController, :index_mrp)

      get("/:sales_id/detail_scheduling", MpsController, :schedule)
      post("/:sales_id/detail_scheduling", MpsController, :create_schedule)
      put("/:sales_id/detail_scheduling/:id", MpsController, :update_schedule)
      get("/:sales_id/detail_scheduling/:id", MpsController, :detail_schedule)
    end

    scope "/sales_forecast" do
      get("/", SalesForecastController, :sales_forecast)
    end

    scope "/sales/:sales_id/analyze_forecast/" do
      put("/:forecast_type", AnalyzeAffectController, :analyze_affect)
    end

    scope "/sales/:sales_id/statistical_forecast" do
      post("/multiplicative", SalesForecastController, :multiplicative)
      get("/multiplicative", SalesForecastController, :index)
      post("/additive", SalesForecastController, :additive)
      get("/additive", SalesForecastController, :index_additive)
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: ScmWeb.Telemetry)
    end
  end
end
