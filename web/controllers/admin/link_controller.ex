defmodule V21.Admin.LinkController do
  use V21.Web, :controller

  alias V21.Link

  def index(conn, _params) do
    links = Repo.all(Link)
    render(conn, "index.html", links: links)
  end

  def new(conn, _params) do
    changeset = Link.changeset(%Link{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"link" => link_params}) do
    changeset = Link.changeset(%Link{}, link_params)

    case Repo.insert(changeset) do
      {:ok, _link} ->
        conn
        |> put_flash(:info, "Link created successfully.")
        |> redirect(to: admin_link_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    link = Repo.get!(Link, id)
    render(conn, "show.html", link: link)
  end

  def edit(conn, %{"id" => id}) do
    link = Repo.get!(Link, id)
    changeset = Link.changeset(link)
    render(conn, "edit.html", link: link, changeset: changeset)
  end

  def update(conn, %{"id" => id, "link" => link_params}) do
    link = Repo.get!(Link, id)
    changeset = Link.changeset(link, link_params)

    case Repo.update(changeset) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link updated successfully.")
        |> redirect(to: admin_link_path(conn, :show, link))
      {:error, changeset} ->
        render(conn, "edit.html", link: link, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    link = Repo.get!(Link, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(link)

    conn
    |> put_flash(:info, "Link deleted successfully.")
    |> redirect(to: admin_link_path(conn, :index))
  end
end
