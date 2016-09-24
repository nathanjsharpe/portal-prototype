defmodule V21.User do
  use V21.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :confirmation_token, :string
    field :confirmed_at, Ecto.DateTime
    field :stripe_token, :string
    field :stripe_customer_id, :string
    field :active_until, Ecto.DateTime

    field :password, :string, virtual: true

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

  def confirmation_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:confirmation_token, :confirmed_at])
  end
end
