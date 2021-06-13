defmodule ScmWeb.ReplanController do
  use ScmWeb, :controller

  alias Scm.Service.Replan, as: ReplanService

  action_fallback(ScmWeb.FallbackController)

  def risk(conn, args) do
    risk = ReplanService.get_risk()
    json(conn, %{data: risk})
  end

  def solutions(conn, args) do
    solutions = ReplanService.get_solution()
    json(conn, %{data: solutions})
  end

  def gen_risk_solution(conn, args) do
    handle = ReplanService.gen_risk_solution(args["solution_id"], args["risk_id"])
    json(conn, %{data: handle})
  end
end
