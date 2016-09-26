defmodule V21.Router do
  use V21.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate_user do
    plug V21.Plug.Authenticate
  end

  pipeline :admin do
    plug V21.Plug.AuthenticateAdmin
  end

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.EmailPreviewPlug
  end

  scope "/", V21 do
    pipe_through :browser

    resources "/registrations", RegistrationController, only: [:new, :create]
    get "/confirm/:token", RegistrationController, :confirm
    resources "/subscriptions", SubscriptionController, only: [:new, :create]
    resources "/organizations", OrganizationController, only: [:new, :create]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  scope "/", V21 do
    pipe_through :browser
    pipe_through :authenticate_user

    resources "/links", LinkController, only: [:index, :show]
    resources "/organizations", OrganizationController, only: [:index]
    resources "/episodes", EpisodeController, only: [:index, :show]
    get "/", EpisodeController, :current
  end

  scope "/admin", V21.Admin, as: :admin do
    pipe_through :browser
    pipe_through :admin

    resources "/episodes", EpisodeController do
      resources "/links", LinkController
    end
  end


  # Other scopes may use custom stacks.
  # scope "/api", V21 do
  #   pipe_through :api
  # end
end
