defmodule ScmWeb.BomController do
  use ScmWeb, :controller

  alias Scm.Service.Bom
  action_fallback(ScmWeb.FallbackController)

  def create(conn, args) do
    Bom.create_bom_from_sales_id(String.to_integer(args["sales_id"]))
    json(conn, %{})
  end

  def index(conn, args) do
    bom = Bom.get_bom(String.to_integer(args["sales_id"]))
    json(conn, %{data: bom})
  end

  def create_mrp(conn, args) do
    Bom.get_mps_by_sales_id(args["month"], String.to_integer(args["sales_id"]))
    |> Bom.create_mrp(args)

    json(conn, %{})
  end

  def index_mrp(conn, args) do
    mrp =
      Bom.get_all_mrp(
        String.to_integer(args["month"]),
        args["ingredient"],
        String.to_integer(args["sales_id"])
      )

    json(conn, %{data: mrp})
  end
end
