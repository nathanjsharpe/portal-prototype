defmodule V21.Organization do
  use V21.Web, :model

  schema "organizations" do
    field :name, :string
    field :street_address, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    field :country, :string
    field :phone, :string
    field :stripe_customer_id, :string
    field :active_until, Timex.Ecto.DateTime

    # User that manages account
    belongs_to :user, V21.User

    # Users that are under account
    has_many :users, V21.User

    timestamps()
  end

  def with_owner(query) do
    from q in query, preload: [:user]
  end

  def create(changeset, reg_changeset, repo) do
    changeset
    |> put_assoc(:user, reg_changeset)
    |> repo.insert
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :street_address, :city, :state, :zip, :country, :phone])
    |> validate_required([:name, :street_address, :city, :state, :zip, :phone])
  end
end
