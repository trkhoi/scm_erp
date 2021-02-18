defmodule ScmWeb.SalesController do
  use ScmWeb, :controller

  alias Scm.Service.Sales, as: SalesService
  alias Scm.Schema.Sales

  action_fallback(ScmWeb.FallbackController)

  def sales_report(conn, args) do
    sales = SalesService.get_sales_with_historical_data(args)
    IO.inspect(sales)
    render(conn, "sales.json", %{sales: sales})
  end
end
