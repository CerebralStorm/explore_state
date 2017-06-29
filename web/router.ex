defmodule ExploreState.Router do
  use ExploreState.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExploreState do
    pipe_through :browser # Use the default browser stack

    get "/", LeadController, :index
    resources "/leads", LeadController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExploreState do
  #   pipe_through :api
  # end
end
