defmodule ScmWeb.FunctionalAreaController do
  use ScmWeb, :controller

  alias Scm.Service.FunctionalArea, as: FunctionalAreaService

  action_fallback(ScmWeb.FallbackController)

  def index(conn, args) do
  end
end
