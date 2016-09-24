defmodule V21.EpisodeController do
  use V21.Web, :controller

  alias V21.Episode

  plug V21.Plug.Authenticate

  def index(conn, _params) do
    episodes = Repo.all(Episode)
    render(conn, "index.html", episodes: episodes)
  end

  def show(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id)
    render(conn, "show.html", episode: episode)
  end

  def current(conn, _params) do
    episode = Episode.current_episode
    render(conn, "show.html", episode: episode)
  end
end
