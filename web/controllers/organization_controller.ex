defmodule V21.OrganizationController do
  use V21.Web, :controller

  alias V21.Organization
  alias V21.Registration
  alias V21.User
  alias V21.Email
  alias V21.Mailer

  def new(conn, _params) do
    changeset = Organization.changeset(%Organization{})
    render conn, changeset: changeset
  end

  def create(conn, %{"organization" => organization_params}) do
    reg_changeset = User.changeset(%User{}, organization_params["user"])
      |> Registration.prepare_create

    changeset = Organization.changeset(%Organization{}, organization_params)

    case Organization.create(changeset, reg_changeset, Repo) do
      {:ok, organization} ->
        Email.organization_confirmation_email(organization) |> Mailer.deliver_now

        conn
        |> put_session(:current_user, organization.user.id)
        |> put_flash(:info, "Created organization. A confirmation email has been sent to the email address provided. Please click the link in the email to verify your email address.")
        |> redirect(to: "/")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
