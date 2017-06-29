defmodule ExploreState.LeadTest do
  use ExploreState.ModelCase

  alias ExploreState.Lead

  @valid_attrs %{address: "some content", city: "some content", parcel_number: "some content", price: "120.5", state: "some content", status: "some content", value: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Lead.changeset(%Lead{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lead.changeset(%Lead{}, @invalid_attrs)
    refute changeset.valid?
  end
end
