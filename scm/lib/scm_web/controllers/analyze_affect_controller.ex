defmodule ScmWeb.AnalyzeAffectController do
  use ScmWeb, :controller

  alias Scm.Service.AnalyzeAffect, as: AnalyzeAffectService

  def analyze_affect(conn, args) do
    AnalyzeAffectService.analyze_affecting_factor(args)
    json(conn, %{})
  end
end
