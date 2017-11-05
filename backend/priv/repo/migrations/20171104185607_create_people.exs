defmodule Backend.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :notes, :string
      add :age, :integer
      add :gender, :integer
      add :school, :string
      add :shirt_size, :integer

      timestamps()
    end

  end
end
