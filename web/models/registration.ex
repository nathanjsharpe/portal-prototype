defmodule V21.Registration do
  alias V21.User
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> prepare_create
    |> repo.insert
  end

  def prepare_create(changeset) do
    changeset
    |> put_change(:confirmation_token, generate_token(64))
    |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
  end

  def confirm(token, repo) do
    repo.get_by!(User, confirmation_token: token)
    |> User.nonpass_changeset
    |> put_change(:confirmation_token, nil)
    |> put_change(:confirmed_at, Timex.now)
    |> repo.update
  end

  def hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  defp generate_token(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end
end
