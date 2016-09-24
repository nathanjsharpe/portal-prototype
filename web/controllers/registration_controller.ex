defmodule V21.RegistrationController do
  use V21.Web, :controller

  alias V21.User
  alias V21.Email
  alias V21.Mailer

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset, amount: 1000
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case V21.Registration.create(changeset, V21.Repo) do
      {:ok, changeset} ->
        Email.welcome_confirmation_email(changeset) |> Mailer.deliver_now

        conn
        |> put_session(:current_user, changeset.id)
        |> put_flash(:info, "Your account was created. Check your email for a link to verify your email address.")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end

  def confirm(conn, %{"token" => token}) do
    case V21.Registration.confirm(token, V21.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Your email address has been confirmed. Thank you!")
        |> redirect(to: "/subscriptions/new")
      :error ->
        conn
        |> put_flash(:error, "Your email address could not be confirmed. Please sign in to resend confirmation email.")
        |> redirect(to: "/")
    end
  end
end
