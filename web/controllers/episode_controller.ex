defmodule V21.EpisodeController do
  use V21.Web, :controller

  alias V21.Episode

  plug V21.Plug.Authenticate

  def index(conn, _params) do
    episodes = V21.Episode
      |> Episode.published
      |> Episode.expired
      |> Repo.all
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
