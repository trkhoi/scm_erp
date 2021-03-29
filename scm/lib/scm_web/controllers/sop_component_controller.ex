defmodule ScmWeb.SopComponentController do
  use ScmWeb, :controller

  alias Scm.Service.SopComponent, as: SopComponentService
  alias Scm.Service.Sop, as: SopService

  action_fallback(ScmWeb.FallbackController)

  def index(conn, args) do
    sop_c =
      SopComponentService.all_sop_component(args)
      |> IO.inspect()

    sop = SopService.get_sop_by_sales_id(args["sales_id"])

    sop_component = %{
      sop_c: sop_c,
      sop: sop
    }

    render(conn, "index.json", %{sop_component: sop_component})
  end

  @spec show(Plug.Conn.t(), nil | maybe_improper_list | map) :: Plug.Conn.t()
  def show(conn, args) do
    sop_component = SopComponentService.get_sop_component(args)
    render(conn, "show.json", %{sop_component: sop_component})
  end

  def create(conn, args) do
    sop = SopService.get_by_id(args["resource_id"])

    {:ok, sop_component} =
      %{
        from_time: args["from_time"],
        to_time: args["to_time"],
        component: args["component"],
        quantity: args["quantity"],
        sop_id: args["resource_id"],
        sales_id: args["sales_id"],
        resource_parent: args["resource_id"],
        resource_type: sop.resource_type
      }
      |> SopComponentService.create_sop_component()

    render(conn, "show.json", %{sop_component: sop_component |> Map.put(:sop, sop)})
  end

  def update(conn, args) do
    {:ok, sop_component} =
      SopComponentService.get_sop_component(args)
      |> IO.inspect()
      |> SopComponentService.update_sop_component(%{
        from_time: args["from_time"],
        to_time: args["to_time"]
      })

    render(conn, "show.json", %{sop_component: sop_component})
  end
end
