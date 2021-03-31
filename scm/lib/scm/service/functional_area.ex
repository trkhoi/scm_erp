defmodule Scm.Service.FunctionalArea do
  import Ecto.Query, warn: false
  alias Scm.Repo

  alias Scm.Schema.{
    FunctionalAreaPlanning,
    FunctionalArea,
    Product,
    FunctionalAreaFeature,
    SopComponent
  }

  def create_data() do
    FunctionalArea
    |> select([fa], fa)
    |> Repo.all()
    |> Enum.map(fn fa ->
      %{
        resources: %{
          id: fa.id,
          name: fa.name
        },
        events: get_sop_component(fa.functional_type, fa.id)
      }
    end)
  end

  def process_data_resource(data) do
    data
    |> Enum.reduce([], fn itm, acc ->
      acc ++ [itm.resources]
    end)
  end

  def process_data_event(data) do
    data
    |> Enum.reduce([], fn itm, acc ->
      acc ++ itm.events
    end)
  end

  def make_event() do
    make = get_functional_area("make")

    all_product()
    |> Enum.map(fn product ->
      %{
        functional_area_id: make.id,
        product_id: product.id,
        title: "Lập khuôn bánh"
      }
    end)
  end

  def cook_event() do
    cook = get_functional_area("cook")

    all_product()
    |> Enum.map(fn product ->
      %{
        functional_area_id: cook.id,
        # product_id: product.id,
        title: "Nướng bánh"
      }
    end)
  end

  def all_product() do
    Product
    |> select([p], p)
    |> Repo.all()
  end

  def get_functional_area(type) do
    FunctionalArea
    |> select([fa], fa)
    |> where([fa], fa.functional_type == ^type)
    |> Repo.one()
  end

  def get_sop_component(type, resource_id) do
    SopComponent
    |> select([sc], sc)
    |> where([sc], sc.type == ^type)
    |> Repo.all()
    |> Enum.map(fn sc ->
      %{
        # product_id: sc.product_id,
        from_time: sc.from_time,
        to_time: sc.to_time,
        title: sc.component,
        functional_area_id: resource_id
      }
    end)
  end

  def get_fa(fa_id) do
    Repo.get(FunctionalArea, fa_id)
  end

  def create_fat(attrs \\ %{}) do
    %FunctionalAreaPlanning{}
    |> FunctionalAreaPlanning.changeset(attrs)
    |> Repo.insert()
  end

  def get_fat_by_id(id) do
    Repo.get(FunctionalAreaPlanning, id)
  end

  def update_fat(%FunctionalAreaPlanning{} = fat, attrs) do
    fat
    |> FunctionalAreaPlanning.changeset(attrs)
    |> Repo.update()
  end
end
