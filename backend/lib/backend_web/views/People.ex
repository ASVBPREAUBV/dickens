defmodule BackendWeb.PeopleView do
  use BackendWeb, :view

  def render("index.json", %{people: people}) do
    %{
      people: Enum.map(people, &person_json/1)
    }
  end

  def render("show.json", %{person: person}) do
    %{ person: person_json(person) }
  end

  def person_json(person) do
    %{
      id: person.id,
      first_name: person.first_name,
      last_name: person.last_name,
      age: person.age
    }
  end
end
