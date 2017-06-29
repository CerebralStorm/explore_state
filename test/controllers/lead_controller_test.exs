defmodule ExploreState.LeadControllerTest do
  use ExploreState.ConnCase

  alias ExploreState.Lead
  @valid_attrs %{address: "some content", city: "some content", parcel_number: "some content", price: "120.5", state: "some content", status: "some content", value: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, lead_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing leads"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, lead_path(conn, :new)
    assert html_response(conn, 200) =~ "New lead"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, lead_path(conn, :create), lead: @valid_attrs
    assert redirected_to(conn) == lead_path(conn, :index)
    assert Repo.get_by(Lead, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, lead_path(conn, :create), lead: @invalid_attrs
    assert html_response(conn, 200) =~ "New lead"
  end

  test "shows chosen resource", %{conn: conn} do
    lead = Repo.insert! %Lead{}
    conn = get conn, lead_path(conn, :show, lead)
    assert html_response(conn, 200) =~ "Show lead"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, lead_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    lead = Repo.insert! %Lead{}
    conn = get conn, lead_path(conn, :edit, lead)
    assert html_response(conn, 200) =~ "Edit lead"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    lead = Repo.insert! %Lead{}
    conn = put conn, lead_path(conn, :update, lead), lead: @valid_attrs
    assert redirected_to(conn) == lead_path(conn, :show, lead)
    assert Repo.get_by(Lead, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    lead = Repo.insert! %Lead{}
    conn = put conn, lead_path(conn, :update, lead), lead: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit lead"
  end

  test "deletes chosen resource", %{conn: conn} do
    lead = Repo.insert! %Lead{}
    conn = delete conn, lead_path(conn, :delete, lead)
    assert redirected_to(conn) == lead_path(conn, :index)
    refute Repo.get(Lead, lead.id)
  end
end
