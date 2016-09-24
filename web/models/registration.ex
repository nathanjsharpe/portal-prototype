defmodule V21.Registration do
  alias V21.User
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> put_change(:confirmation_token, generate_token(64))
    |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert
  end

  def confirm(token, repo) do
    {:ok, current_time } = Ecto.DateTime.cast(:calendar.universal_time)

    repo.get_by!(User, confirmation_token: token)
    |> User.confirmation_changeset(%{confirmation_token: nil, confirmed_at: current_time})
    |> repo.update
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  defp generate_token(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end
end
