defmodule V21.Repo.Migrations.CreateCollection do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :title, :string
      add :publish_at, :datetime
      add :expire_at, :datetime
      add :free, :boolean, default: false, null: false
      add :description, :string

      timestamps()
    end

  end
end
