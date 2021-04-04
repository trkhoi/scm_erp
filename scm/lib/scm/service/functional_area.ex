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

  def make_event(list_sop_id) do
    make = get_functional_area("make")

    # all_product()
    list_sop_id
    |> Enum.map(fn product ->
      %{
        functional_area_id: make.id,
        sop_id: product,
        # product_id: product.id,
        from_time: DateTime.utc_now(),
        to_time: DateTime.utc_now() |> DateTime.add(3600, :second),
        title: "Lập khuôn bánh"
      }
    end)
  end

  def cook_event(list_sop_id) do
    cook = get_functional_area("cook")

    # all_product()
    list_sop_id
    |> Enum.map(fn product ->
      %{
        functional_area_id: cook.id,
        sop_id: product,
        from_time: DateTime.utc_now(),
        to_time: DateTime.utc_now() |> DateTime.add(7200, :second),
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
        sop_id: sc.sop_id,
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

  def get_list_sop_id(events) do
    event_sop_id =
      events
      |> Enum.reduce([], fn event, acc ->
        case Map.has_key?(event, :sop_id) do
          true -> acc ++ [event.sop_id]
          false -> acc
        end
      end)
      |> Enum.uniq()
  end

  def get_all_fap(list_sop_id) do
    FunctionalAreaPlanning
    |> select([fap], fap)
    |> where([fap], fap.sop_id in ^list_sop_id)
    |> Repo.all()
  end

  def check_duplicate_recode(all_event) do
    list_sop = get_list_sop_id(all_event)

    all_sop_id =
      FunctionalAreaPlanning
      |> select([fap], fap.sop_id)
      |> Repo.all()
      |> Enum.uniq()

    check_duplicate_recode =
      list_sop
      |> Enum.reduce([], fn sop, _acc ->
        case sop in all_sop_id do
          true -> true
          false -> false
        end
      end)
  end
end
