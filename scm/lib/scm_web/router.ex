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

    get("/sales/:sales_id/sop/:sop_id/sop_componnent/", SopComponentController, :index)
    get("/sales/:sales_id/sop/:sop_id/sop_componnent/:id", SopComponentController, :show)
    post("/sales/:sales_id/sop/:sop_id/sop_componnent/", SopComponentController, :create)
    put("/sales/:sales_id/sop/:sop_id/sop_componnent/:id", SopComponentController, :update)

    scope "/sales" do
      get("/finance_statstic", SalesController, :finance_statistic)

      scope "/historical_data" do
        get("/", SalesController, :sales_report)
      end

      scope "/compare_market" do
        get("/", SalesController, :evaluate_market)
      end

      get("/:sales_id/demand_daily", MpsController, :daily_mps)
      get("/:sales_id/demand_weekly", MpsController, :weekly_mps)
      post("/:sales_id/sop", SopController, :sop)
      put("/:sales_id/sop/", SopController, :update_sop)

      # scope "/:sales_id/sop/" do
      #   get("/:sop_id/sop_componnent/", SopComponentController, :index)
      #   get("/:sop_id/sop_componnent/:id", SopComponentController, :show)
      #   post("/:sop_id/sop_componnent/", SopComponentController, :create)
      #   put("/:sop_id/sop_componnent/:id", SopComponentController, :update)
      # end

      get("/:sales_id/detail_scheduling", MpsController, :detail_schedule)
      post("/:sales_id/detail_scheduling", MpsController, :create_schedule)
      put("/:sales_id/detail_scheduling/:id", MpsController, :update_schedule)
    end

    scope "/sales_forecast" do
      get("/", SalesForecastController, :sales_forecast)
    end
  end

  # scope "/api/v1", ScmWeb do
  #   pipe_through(:browser)

  #   get("/", PageController, :index)
  #   get("/hello", HelloController, :index)

  # scope "/sales" do
  #   get("/finance_statstic", SalesController, :finance_statistic)

  #   scope "/historical_data" do
  #     get("/", SalesController, :sales_report)
  #   end

  #   scope "/compare_market" do
  #     get("/", SalesController, :evaluate_market)
  #   end
  # end

  # scope "/sales_forecast" do
  #   get("/", SalesForecastController, :sales_forecast)
  # end
  # end

  # Other scopes may use custom stacks.
  # scope "/api", ScmWeb do
  #   pipe_through :api
  # end

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
