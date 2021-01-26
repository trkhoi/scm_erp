defmodule ScmWeb.PageController do
  use ScmWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
