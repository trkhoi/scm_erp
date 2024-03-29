defmodule ScmWeb.SalesController do
  use ScmWeb, :controller

  alias Scm.Service.Sales, as: SalesService
  alias Scm.Schema.Sales

  action_fallback(ScmWeb.FallbackController)

  def sales_report(conn, args) do
    sales = SalesService.get_sales_with_historical_data(args)
    render(conn, "sales.json", %{sales: sales})
  end

  def evaluate_market(conn, args) do
    eva = SalesService.evaluate_market(args)
    render(conn, "evaluate.json", %{eva: eva})
  end

  def finance_statistic(conn, args) do
    fs = SalesService.finance_statistic(args)
    render(conn, "finance_statistic.json", %{fs: fs})
  end

  def show(conn, args) do
    sales = SalesService.get_sales(args["sales_id"])
    render(conn, "sale.json", %{sales: sales})
  end
end
