defmodule ScmWeb.FunctionalAreaController do
  use ScmWeb, :controller

  alias Scm.Service.FunctionalArea, as: FunctionalAreaService

  action_fallback(ScmWeb.FallbackController)

  def index(conn, args) do
    resources =
      FunctionalAreaService.create_data()
      |> FunctionalAreaService.process_data_resource()

    events =
      FunctionalAreaService.create_data()
      |> FunctionalAreaService.process_data_event()
      |> IO.inspect()

    list_sop_id = FunctionalAreaService.get_list_sop_id(events)

    make_event = FunctionalAreaService.make_event(list_sop_id)
    cook_event = FunctionalAreaService.cook_event(list_sop_id)

    all_event = events ++ make_event ++ cook_event

    all_event =
      all_event
      |> FunctionalAreaService.check_duplicate_recode()
      |> case do
        true ->
          FunctionalAreaService.get_all_fap(list_sop_id)

        false ->
          all_event
          |> Enum.map(fn eve ->
            FunctionalAreaService.create_fat(eve)
            |> case do
              {:ok, value} -> value
              {:error, err} -> err
            end
          end)
          |> IO.inspect()
      end

    fa = %{
      events: all_event,
      resources: resources
    }

    render(conn, "index.json", %{functional_area: fa})
  end

  def create(conn, args) do
    {:ok, fat} =
      FunctionalAreaService.create_fat(%{
        from_time: args["from_time"],
        to_time: args["to_time"],
        title: args["component"],
        functional_area_id: args["resource_id"],
        type: args["type"]
      })

    resource = FunctionalAreaService.get_fa(args["resource_id"])

    fa = %{
      events: fat,
      resources: resource
    }

    render(conn, "show.json", %{functional_area: fa})
  end

  def update(conn, args) do
    fat = FunctionalAreaService.get_fat_by_id(args["id"])

    {:ok, new_fat} =
      FunctionalAreaService.update_fat(fat, %{
        from_time: args["from_time"],
        to_time: args["to_time"]
      })

    resource = FunctionalAreaService.get_fa(fat.functional_area_id)

    fa = %{
      events: new_fat,
      resources: resource
    }

    render(conn, "show.json", %{functional_area: fa})
  end

  def show(conn, args) do
    fat = FunctionalAreaService.get_fat_by_id(args["id"])
    resource = FunctionalAreaService.get_fa(fat.functional_area_id)

    fa = %{
      events: fat,
      resources: resource
    }

    render(conn, "show.json", %{functional_area: fa})
  end
end
