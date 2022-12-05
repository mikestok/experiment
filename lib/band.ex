defmodule Band do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "bands" do
    field :name, :string
  end
end
