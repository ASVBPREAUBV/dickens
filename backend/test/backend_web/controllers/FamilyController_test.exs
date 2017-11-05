defmodule Backend.FamilyControllerTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias Backend.Person
  alias Backend.Repo
  alias Ecto.Adapters.SQL

  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end
  
# [:first_name, :last_name, :notes, :age, :gender, :school, :shirt_size]

  test "/index returns a list of contacts" do
    people_as_json =
      %Person{first_name: "Dade", last_name: "Murphy", notes: ""}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/people") |> send_request

    assert response.status == 200
    assert response.resp_body == people_as_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Backend.Endpoint.call([])
  end
end
