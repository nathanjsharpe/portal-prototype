defmodule V21.Email do
  use Bamboo.Phoenix, view: V21.EmailView

  def user_confirmation_email(user) do
    new_email
    |> to(user.email)
    |> from("nathan@cliftonlabs.com")
    |> subject("V21: Please confirm your email")
    |> assign(:user, user)
    |> render(:user_confirmation_email)
  end

  def subscription_welcome_email(user) do
    new_email
    |> to(user.email)
    |> from("nathan@cliftonlabs.com")
    |> subject("Welcome to V21!")
    |> html_body("You've been subscribed! Awesome!")
    |> text_body("You've been subscribed! Awesome!")
  end

  def organization_confirmation_email(organization) do
    new_email
    |> to(organization.user.email)
    |> from("nathan@cliftonlabs.com")
    |> subject("V21: Please confirm your email")
    |> assign(:organization, organization)
    |> render(:organization_confirmation_email)
  end

  def invitation_email(user, account) do
    new_email
    |> to(user.email)
    |> from("nathan@cliftonlabs.com")
    |> subject("Someone has invited you!")
    |> html_body("You've been invited. Click somewhere.")
    |> text_body("You've been invited. Click somewhere.")
  end
end
