defmodule V21.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :publish_at, :datetime
      add :expire_at, :datetime
      add :free, :boolean, default: false, null: false
      add :description, :text

      timestamps()
    end

  end
end
