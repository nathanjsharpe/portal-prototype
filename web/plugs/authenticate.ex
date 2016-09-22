defmodule V21.Plug.Authenticate do
  import Plug.Conn
  import Phoenix.Controller

  alias V21.Session

  def init(default), do: default

  def call(conn, default) do
    if !Session.logged_in?(conn) do
      conn
      |> put_flash(:error, "You need to be signed in to view this page")
      |> redirect(to: "/login")
    else
      conn
    end
  end

end
