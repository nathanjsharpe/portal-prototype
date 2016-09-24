defmodule V21.Repo.Migrations.CreateOrganizations do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name, :string
      add :street_address, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :country, :string
      add :phone, :string
      add :stripe_customer_id, :string
      add :active_until, :datetime

      add :user_id, references(:users)

      timestamps()
    end
    create unique_index(:organizations, [:user_id])
  end
end
