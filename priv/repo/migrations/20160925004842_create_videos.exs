defmodule V21.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :description, :text
      add :vimeo_id, :string
      add :category, :string

      add :episode_id, references(:episodes)

      timestamps()
    end
    create index(:videos, [:episode_id])
  end
end
