defmodule ScmWeb.SopComponentController do
  use ScmWeb, :controller

  alias Scm.Service.SopComponent, as: SopComponentService

  action_fallback(ScmWeb.FallbackController)

  def index(conn, args) do
    sop_component = SopComponentService.all_sop_component(args)

    render(conn, "index.json", %{sop_component: sop_component})
  end

  @spec show(Plug.Conn.t(), nil | maybe_improper_list | map) :: Plug.Conn.t()
  def show(conn, args) do
    sop_component = SopComponentService.get_sop_component(args)
    render(conn, "show.json", %{sop_component: sop_component})
  end

  def create(conn, args) do
    {:ok, sop_component} =
      %{
        from_time: args["from_time"],
        to_time: args["to_time"],
        component: args["component"],
        quantity: args["quantity"],
        sop_id: args["sop_id"],
        sales_id: args["sales_id"]
      }
      |> SopComponentService.create_sop_component()

    render(conn, "show.json", %{sop_component: sop_component})
  end

  def update(conn, args) do
    {:ok, sop_component} =
      SopComponentService.get_sop_component(args)
      |> SopComponentService.update_sop_component(%{
        from_time: args["from_time"],
        to_time: args["to_time"]
      })

    render(conn, "show.json", %{sop_component: sop_component})
  end
end
