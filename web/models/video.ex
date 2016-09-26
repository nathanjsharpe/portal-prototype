defmodule V21.Video do
  use V21.Web, :model

  schema "videos" do
    field :title, :string
    field :description, :string
    field :vimeo_id, :string
    field :category, :string

    field :vimeo_link, :string, virtual: true

    belongs_to :episode, V21.Episode

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :vimeo_id, :category, :episode_id])
    |> validate_required([:title, :description, :href, :category, :episode_id])
  end
end
