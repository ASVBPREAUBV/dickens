defmodule BackendWeb.PeopleController do
  use BackendWeb, :controller
  alias Backend.Repo
  alias Backend.Person

  def index(conn, _params) do
    people = Repo.all(Person)
    render(conn, "index.json", people: people)
  end

  def show(conn, %{"id" => id}) do
    person = Repo.get(Person, id)
    render(conn, "show.json", person: person)
  end

  def create(conn, params) do
    person = %Person{} |> Person.changeset(params) |> Repo.insert!
    render(conn, "show.json", person: person)
  end

  def update(conn, params) do
    person = Repo.get(Person, params["id"])
    Person.changeset(person, params) |> Repo.update
    person = Repo.get(Person, params["id"])
    render(conn, "show.json", person: person)
  end
end
