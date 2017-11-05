defmodule Backend.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Person

  schema "people" do
    field :age, :integer
    field :first_name, :string
    field :gender, :integer
    field :last_name, :string
    field :notes, :string
    field :school, :string
    field :shirt_size, :integer
    field :family_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :notes, :age, :gender, :school, :shirt_size])
    |> validate_required([:first_name, :last_name, :gender, :age])
  end
end
