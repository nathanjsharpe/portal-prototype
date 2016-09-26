defmodule V21.Plug.AuthenticateAdmin do
  import Plug.Conn
  import Phoenix.Controller

  alias V21.Session

  def init(default), do: default

  def call(conn, default) do
    if !Session.admin_logged_in?(conn) do
      conn
      |> put_flash(:error, "You must be an admin to view this page.")
      |> redirect(to: "/login")
    else
      conn
    end
  end

end
