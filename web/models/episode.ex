defmodule V21.Episode do
  use V21.Web, :model

  schema "episodes" do
    field :title, :string
    field :publish_at, Ecto.DateTime
    field :expire_at, Ecto.DateTime
    field :free, :boolean, default: false
    field :description, :string

    has_many :links, V21.Link

    timestamps()
  end

  def current_episode do
    V21.Episode
    |> where([e], e.publish_at <= ^Timex.now and e.expire_at >= ^Timex.now)
    |> preload([:links])
    |> V21.Repo.one
  end

  def published(query) do
    query |> where([e], e.publish_at <= ^Timex.now)
  end

  def expired(query) do
    query |> where([e], e.expire_at <= ^Timex.now)
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
