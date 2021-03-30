defmodule Scm.Service.FunctionalArea do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{FunctionalAreaPlanning, FunctionalArea, Product, FunctionalAreaFeature}

  def get_all_functional_area() do
    FunctionalArea
    |> select([fa], fa)
    |> Repo.all()
  end
end
