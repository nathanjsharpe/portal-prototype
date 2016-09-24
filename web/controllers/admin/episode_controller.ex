defmodule V21.Admin.EpisodeController do
  use V21.Web, :controller

  alias V21.Episode

  def index(conn, _params) do
    episodes = Episode |> Repo.all |> Repo.preload([:links])
    render(conn, "index.html", episodes: episodes)
  end

  def new(conn, _params) do
    changeset = Episode.changeset(%Episode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"episode" => episode_params}) do
    changeset = Episode.changeset(%Episode{}, episode_params)

    case Repo.insert(changeset) do
      {:ok, _episode} ->
        conn
        |> put_flash(:info, "Episode created successfully.")
        |> redirect(to: admin_episode_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    episode = Episode |> Repo.get!(id) |> Repo.preload([:links])
    render(conn, "show.html", episode: episode)
  end

  def edit(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)
    changeset = Episode.changeset(episode)
    render(conn, "edit.html", episode: episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "episode" => episode_params}) do
    episode = Repo.get!(Episode, id)
    changeset = Episode.changeset(episode, episode_params)

    case Repo.update(changeset) do
      {:ok, episode} ->
        conn
        |> put_flash(:info, "Episode updated successfully.")
        |> redirect(to: admin_episode_path(conn, :show, episode))
      {:error, changeset} ->
        render(conn, "edit.html", episode: episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(episode)

    conn
    |> put_flash(:info, "Episode deleted successfully.")
    |> redirect(to: admin_episode_path(conn, :index))
  end
end
