defmodule V21.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :description, :string
      add :href, :string

      timestamps()
    end

  end
end
