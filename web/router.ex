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

  scope "/", V21 do
    pipe_through :browser # Use the default browser stack

    resources "/links", LinkController, only: [:index, :show]
    resources "/registrations", RegistrationController, only: [:new, :create]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
    resources "/", CollectionController, only: [:index, :show]
  end

  scope "/admin", V21.Admin, as: :admin do
    pipe_through :browser

    resources "/collections", CollectionController
    resources "/links", LinkController
  end

  # Other scopes may use custom stacks.
  # scope "/api", V21 do
  #   pipe_through :api
  # end
end
