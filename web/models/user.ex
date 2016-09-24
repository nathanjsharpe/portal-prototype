defmodule V21.User do
  use V21.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :confirmation_token, :string
    field :confirmed_at, Timex.Ecto.DateTime
    field :stripe_token, :string
    field :stripe_customer_id, :string
    field :active_until, Timex.Ecto.DateTime

    field :password, :string, virtual: true

    has_one :owned_organization, V21.Organization, foreign_key: :user_id
    belongs_to :organization, V21.Organization

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end

  def nonpass_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
  end

  def confirmation_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:confirmation_token, :confirmed_at])
  end

  def subscription_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:stripe_customer_id, :active_until])
  end
end
