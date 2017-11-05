defmodule Backend.Family do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Family


  schema "families" do
    field :address, :string
    field :address2, :string
    field :approved, :boolean, default: false
    field :certificate, :boolean, default: false
    field :city, :string
    field :food, :integer
    field :key, :string
    field :notes, :string
    field :phone1, :string
    field :phone2, :string
    field :rural, :boolean, default: false
    field :toys, :boolean, default: false
    field :zip, :integer
    field :adult1_id, :id
    field :adult2_id, :id
    field :children, {:array, :id}
    field :others, {:array, :id}

    timestamps()
  end

  @doc false
  def changeset(%Family{} = family, attrs) do
    family
    |> cast(attrs, [:key, :adult1_id, :adult2_id, :children, :others, :phone1, :phone2, :address, :address2, :city, :zip, :rural, :approved, :toys, :certificate, :food, :notes])
    |> validate_required([:key, :adult1_id, :phone1, :address, :address2, :city, :zip, :rural, :approved, :toys, :certificate, :food])
  end
end
