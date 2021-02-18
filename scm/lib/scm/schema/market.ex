defmodule Scm.Schema.Market do
  use Ecto.Schema
  import Ecto.Changeset

  schema "market" do
    field(:company, :string)
    field(:code, :string)
    field(:product_type, :string)
    field(:price, :float)

    timestamps()
  end

  @attrs [:company, :code, :product_type, :price]

  def changeset(market, attrs) do
    market
    |> cast(attrs, @attrs)
  end
end
