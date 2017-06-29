defmodule ExploreState.Lead do
  use ExploreState.Web, :model

  schema "leads" do
    field :parcel_number, :string
    field :address, :string
    field :city, :string
    field :state, :string
    field :status, :string
    field :price, :decimal
    field :value, :decimal

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:parcel_number, :address, :city, :state, :status, :price, :value])
    |> validate_required([:parcel_number, :address, :city, :state, :status, :price, :value])
  end
end
