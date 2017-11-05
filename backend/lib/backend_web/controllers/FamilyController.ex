defmodule BackendWeb.FamilyController do
  use BackendWeb, :controller
  alias Backend.Repo
  alias Backend.Family

  def index(conn, _params) do
    families = Repo.all(Family)
    render(conn, "index.json", families: families)
  end

  def show(conn, %{"id" => id}) do
    family = Repo.get(Family, id)
    render(conn, "show.json", family: family)
  end

  def create(conn, params) do
    family = %Family{} |> Family.changeset(params) |> Repo.insert!
    render(conn, "show.json", family: family)
  end

  def update(conn, params) do
    family = Repo.get(Family, params["id"])
    Family.changeset(family, params) |> Repo.update
    family = Repo.get(Family, params["id"])
    render(conn, "show.json", family: family)
  end
end
