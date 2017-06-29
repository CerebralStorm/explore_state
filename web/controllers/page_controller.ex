defmodule ExploreState.PageController do
  use ExploreState.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
