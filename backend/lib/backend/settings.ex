defmodule Backend.Settings do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Settings


  schema "settings" do
    field :data, :map
    field :version, :integer

    timestamps()
  end

  @doc false
  def changeset(%Settings{} = settings, attrs) do
    settings
    |> cast(attrs, [:version, :data])
    |> validate_required([:version, :data])
  end
end
