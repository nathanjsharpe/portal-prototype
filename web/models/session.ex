defmodule V21.Session do
  alias V21.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _ -> :error
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: V21.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  def admin_logged_in?(conn), do: logged_in?(conn) && current_user(conn).admin

  defp authenticate(user, password) do
    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end
end
