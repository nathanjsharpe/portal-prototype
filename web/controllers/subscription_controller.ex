defmodule V21.SubscriptionController do
  use V21.Web, :controller

  plug V21.Plug.Authenticate

  def new(conn, _params) do
    render(conn, "new.html", annual_cost: 80)
  end

  def create(conn, %{"stripeToken" => stripe_token}) do
    case V21.Subscription.create(current_user(conn), stripe_token, "student_solo", V21.Repo) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for subscribing!")
        |> redirect(to: "/")
      {:error, message} ->
        conn
        |> put_flash(:error, "Failed to create subscription! Please contact support.")
        |> render("new.html")
    end
  end
end
