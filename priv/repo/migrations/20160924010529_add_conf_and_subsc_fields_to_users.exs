defmodule V21.Repo.Migrations.AddConfAndSubscFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :confirmation_token, :string
      add :confirmed_at, :datetime
      add :stripe_token, :string
      add :stripe_customer_id, :string
      add :active_until, :datetime
    end
    create unique_index(:users, [:confirmation_token])
  end
end
