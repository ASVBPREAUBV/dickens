defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackendWeb do
    pipe_through :api

    get "/family", FamilyController, :index
    get "/family/:id", FamilyController, :show
    patch "/family/:id", FamilyController, :update
    post "/family", FamilyController, :create

    get "/people", PeopleController, :index
    get "/people/:id", PeopleController, :show
    patch "/people/:id", PeopleController, :update
    post "/people", PeopleController, :create

    get "/settings", PeopleController, :index
    patch "/settings", PeopleController, :update
  end
end
