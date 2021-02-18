defmodule ScmWeb.ErrorView do
  use ScmWeb, :view

  require Logger

  @doc "render 500"
  def render("500.json", _assign) do
    render_error("InternalServerError", "Something went wrong")
  end

  @doc """
    render 404
    depends on the error, we will specify the error message for the UI
  """
  def render("404.json", %{reason: reason}) do
    case reason do
      %Phoenix.Router.NoRouteError{} ->
        render_error("NotFound", "Route not found")

      %Ecto.NoResultsError{message: error} when is_binary(error) ->
        render_error("NotFound", "Resource not found", %{detail: error})

      error when is_binary(error) ->
        render_error("NotFound", "Not found", %{detail: error})

      _ ->
        render_error("NotFound", "Not found")
    end
  end

  @doc "render 401"
  def render("401.json", _assign) do
    render_error("Unauthorized", "Unauthorized request")
  end

  @doc "render 400"
  def render("400.json", %{reason: reason}) do
    case reason do
      %Ecto.Query.CastError{message: error} when is_binary(error) ->
        render_error("BadRequest", "Bad Request", %{detail: error})

      _ ->
        render_error("BadRequest", reason)
    end
  end

  @doc "render 422 with changeset"
  def render("422.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    render_error("UnprocessableEntity", "Bad request", translate_changeset_errors(changeset))
  end

  @spec translate_changeset_errors(Ecto.Changeset.t()) :: %{optional(atom) => [binary | map]}
  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `BusiApiWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_changeset_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  @spec render_error(String.t(), String.t(), map()) :: map()
  def render_error(error, message, detail \\ %{}) do
    %{
      error: error,
      message: message,
      detail: detail
    }
  end

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Logger.warn("missing error template #{template}")

    %{
      error: Phoenix.Controller.status_message_from_template(template),
      message: Phoenix.Controller.status_message_from_template(template),
      detail: %{}
    }
  end
end
