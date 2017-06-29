defmodule ExploreState.Repo.Migrations.CreateLead do
  use Ecto.Migration

  def change do
    create table(:leads) do
      add :parcel_number, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :status, :string
      add :price, :decimal
      add :value, :decimal

      timestamps()
    end

  end
end
