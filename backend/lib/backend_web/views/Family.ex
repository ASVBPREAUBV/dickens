defmodule BackendWeb.FamilyView do
  use BackendWeb, :view

  def render("index.json", %{families: families}) do
    %{
      families: Enum.map(families, &family_json/1)
    }
  end

  def render("show.json", %{family: family}) do
    %{ family: family_json(family) }
  end

  def family_json(family) do
    %{
      id: family.id,
      address: family.address,
      address2: family.address2,
      approved: family.approved,
      certificate: family.certificate,
      city: family.city,
      food: family.food,
      key: family.key,
      notes: family.notes,
      phone1: family.phone1,
      phone2: family.phone2,
      zip: family.zip,
      adult1_id: family.adult1_id,
      adult2_id: family.adult2_id,
      children: family.children,
      others: family.others
    }
  end
end
