defmodule Scm.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customer) do
      add(:name, :string)
      add(:metadata, :map)
      add(:email, :string)
      add(:avatar, :string)
      add(:desciption, :string)

      timestamps()
    end
  end
end
