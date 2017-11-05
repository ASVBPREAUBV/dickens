defmodule Backend.Repo.Migrations.CreateFamilies do
  use Ecto.Migration

  def change do
    create table(:families) do
      add :key, :string, null: false
      add :phone1, :string, null: false
      add :phone2, :string, null: false
      add :address, :string, null: false
      add :address2, :string
      add :city, :string, null: false
      add :zip, :integer, null: false
      add :rural, :boolean, default: false, null: false
      add :approved, :boolean, default: false, null: false
      add :toys, :boolean, default: false, null: false
      add :certificate, :boolean, default: false, null: false
      add :food, :integer, null: false
      add :notes, :text
      add :adult1_id, references(:people, on_delete: :nothing)
      add :adult2_id, references(:people, on_delete: :nothing)
      add :children, {:array, :uuid}
      add :others, {:array, :uuid}

      timestamps()
    end

    alter table(:people) do
      add :family_id, references(:families, on_delete: :nothing)
    end

    create index(:people, [:family_id])
    create index(:families, [:adult1_id])
    create index(:families, [:adult2_id])
    create index(:families, [:children])
    create index(:families, [:others])
  end
end
