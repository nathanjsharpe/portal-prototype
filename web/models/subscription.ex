defmodule V21.Subscription do
  alias V21.User
  import Ecto.Changeset, only: [put_change: 3]

  def create(user, stripe_token, plan, repo) do
    case create_stripe_customer(user, stripe_token, plan) do
      {:ok, customer_id, current_period_end} ->
        user
        |> User.nonpass_changeset
        |> put_change(:stripe_customer_id, customer_id)
        |> put_change(:active_until, current_period_end)
        |> repo.update
      {:error, message} ->
        {:error, message}
    end
  end

  def create_stripe_customer(user, stripe_token, plan) do
    case Stripe.Customers.create([
      source: stripe_token,
      plan: plan,
      email: user.email
    ]) do
      {:ok, response} ->
        customer_id = response[:id]
        current_period_end = response[:subscriptions]["data"]
          |> hd
          |> Map.get("current_period_end")
          |> Timex.from_unix
        {:ok, customer_id, current_period_end}
      {:error, message} ->
        {:error, message}
    end
  end
end
