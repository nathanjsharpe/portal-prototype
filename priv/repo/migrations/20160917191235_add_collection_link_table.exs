defmodule V21.Repo.Migrations.AddCollectionLinkTable do
  use Ecto.Migration

  def change do
    create table(:collection_link) do
      add :collection_id, references(:collections)
      add :link_id, references(:links)
      add :priority, :integer
    end
    create index(:collection_link, [:collection_id])
    create index(:collection_link, [:link_id])
  end
end
