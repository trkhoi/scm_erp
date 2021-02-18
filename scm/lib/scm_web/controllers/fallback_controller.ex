defmodule ScmWeb.FallbackController do
  @moduledoc """
  Translates endpoint action results into valid `Plug.Conn` responses
  """
  use ScmWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ScmWeb.ErrorView)
    |> render("422.json", changeset: changeset)
  end

  def call(conn, %{errors: errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ScmWeb.ErrorView)
    |> render("422.json", errors: errors)
  end

  def call(conn, {:error, :bad_request, reason: reason}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ScmWeb.ErrorView)
    |> render("400.json", %{reason: reason})
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ScmWeb.ErrorView)
    |> render("401.json")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ScmWeb.ErrorView)
    |> render("404.json", %{reason: "Not Found"})
  end

  def call(conn, _) do
    conn
    |> put_status(500)
    |> put_view(ScmWeb.ErrorView)
    |> render("500.json")
  end
end
