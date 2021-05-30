defmodule Scm.Service.Supplier do
  import Ecto.Query, warn: false
  alias Scm.Repo
  alias Ecto.Changeset

  alias Scm.Schema.{Solution, SupplierStatus, NewBom}

  def supplier_status() do
    SupplierStatus
    |> select([ss], ss)
    |> preload([:status, :supplier])
    |> Repo.all()
    |> Enum.map(fn itm ->
      %{
        id: itm.supplier.id,
        supplier_name: itm.supplier.name,
        status: itm.status.status_name,
        status_type: itm.status.status
      }
    end)
  end

  def solution() do
    Repo.all(Solution)
    |> Enum.filter(fn itm ->
      itm.type != "substitute"
    end)
    |> Enum.map(fn itm ->
      %{
        id: itm.id,
        solution: itm.solution,
        type: itm.type,
        recommend_for_status: recommend(itm.type)
      }
    end)

    # |>
  end

  def recommend("extra_inventory") do
    ["Supplier Struggle"]
  end

  def recommend("change_supplier") do
    ["Supplier Maintain", "Supplier Collapse"]
  end

  def recommend("temporary") do
    ["Supplier Delay Delivery"]
  end

  def handle_issue("temporary") do
    Repo.all(NewBom)
    |> Enum.map(fn itm ->
      %{
        product: itm.product,
        material: itm.material,
        quantity: itm.quantity * 0.3
      }
    end)
  end

  def handle_issue("extra_inventory") do
    Repo.all(NewBom)
    |> Enum.map(fn itm ->
      %{
        product: itm.product,
        material: itm.material,
        quantity: itm.quantity + itm.quantity * 1
      }
    end)
  end
end
