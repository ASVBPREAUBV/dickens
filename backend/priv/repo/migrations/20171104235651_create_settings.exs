defmodule Backend.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :version, :integer
      add :data, :map

      timestamps()
    end

  end
end
