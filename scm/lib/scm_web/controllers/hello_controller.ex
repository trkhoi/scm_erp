defmodule ScmWeb.HelloController do
  use ScmWeb, :controller

  def index(conn, _params) do
    greetings = %{
      content: "Init source code for thesis",
      title: "Check API"
    }

    render(conn, "index.json", %{greetings: greetings})
  end
end
