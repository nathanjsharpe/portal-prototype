defmodule V21.Collection do
  use V21.Web, :model

  schema "collections" do
    field :title, :string
    field :publish_at, Ecto.DateTime
    field :expire_at, Ecto.DateTime
    field :free, :boolean, default: false
    field :description, :string

    has_many :links, V21.Link

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :publish_at, :expire_at, :free, :description])
    |> validate_required([:title, :publish_at, :expire_at, :free, :description])
  end
end
