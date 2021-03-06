defmodule V21.Link do
  use V21.Web, :model

  schema "links" do
    field :title, :string
    field :description, :string
    field :href, :string
    field :category, :string

    belongs_to :episode, V21.Episode

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :href, :category, :episode_id])
    |> validate_required([:title, :description, :href, :category, :episode_id])
  end
end
