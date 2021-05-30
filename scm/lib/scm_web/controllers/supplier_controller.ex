defmodule ScmWeb.SupplierController do
  use ScmWeb, :controller

  alias Scm.Service.Supplier, as: SupplierService

  action_fallback(ScmWeb.FallbackController)

  def supplier_status(conn, _args) do
    supplier = SupplierService.supplier_status()
    json(conn, %{data: supplier})
  end

  def solution(conn, _args) do
    solution = SupplierService.solution()
    json(conn, %{data: solution})
  end

  def handle_issue(conn, args) do
    new_bom = SupplierService.handle_issue(args["type"])
    json(conn, %{data: new_bom})
  end
end
