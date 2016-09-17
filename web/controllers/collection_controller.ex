defmodule V21.CollectionController do
  use V21.Web, :controller

  alias V21.Collection

  def index(conn, _params) do
    collections = Repo.all(Collection)
    render(conn, "index.html", collections: collections)
  end

  def show(conn, %{"id" => id}) do
    collection = Repo.get!(Collection, id)
    render(conn, "show.html", collection: collection)
  end
end
