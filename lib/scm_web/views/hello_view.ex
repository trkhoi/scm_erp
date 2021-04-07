defmodule ScmWeb.HelloView do
  use ScmWeb, :view

  def render("index.json", %{greetings: greetings}) do
    %{
      data: %{
        title: greetings.title,
        content: greetings.content
      }
    }
  end
end
