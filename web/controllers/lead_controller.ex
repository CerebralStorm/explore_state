require IEx;

defmodule ExploreState.LeadController do
  use ExploreState.Web, :controller

  alias ExploreState.Lead

  def index(conn, _params) do
    leads = Repo.all(Lead)
    render(conn, "index.html", leads: leads)
  end

  def new(conn, _params) do
    changeset = Lead.changeset(%Lead{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lead" => lead_params}) do
    IEx.pry
    changeset = Lead.changeset(%Lead{}, lead_params)

    case Repo.insert(changeset) do
      {:ok, _lead} ->
        conn
        |> put_flash(:info, "Lead created successfully.")
        |> redirect(to: lead_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lead = Repo.get!(Lead, id)
    render(conn, "show.html", lead: lead)
  end

  def edit(conn, %{"id" => id}) do
    lead = Repo.get!(Lead, id)
    changeset = Lead.changeset(lead)
    render(conn, "edit.html", lead: lead, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lead" => lead_params}) do
    lead = Repo.get!(Lead, id)
    changeset = Lead.changeset(lead, lead_params)

    case Repo.update(changeset) do
      {:ok, lead} ->
        conn
        |> put_flash(:info, "Lead updated successfully.")
        |> redirect(to: lead_path(conn, :show, lead))
      {:error, changeset} ->
        render(conn, "edit.html", lead: lead, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lead = Repo.get!(Lead, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(lead)

    conn
    |> put_flash(:info, "Lead deleted successfully.")
    |> redirect(to: lead_path(conn, :index))
  end
end
