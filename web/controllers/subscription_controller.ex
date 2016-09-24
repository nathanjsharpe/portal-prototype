require IEx

defmodule V21.SubscriptionController do
  use V21.Web, :controller

  plug V21.Plug.Authenticate

  def new(conn, _params) do
    render(conn, "new.html", annual_cost: 80)
  end

  def create(conn, %{"stripeToken" => stripe_token}) do
    IEx.pry
    render(conn, "new.html", annual_cost: 80)
  end
end
