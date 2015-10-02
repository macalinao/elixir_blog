defmodule ElixirBlog.Router do
  use ElixirBlog.Web, :router

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

  scope "/", ElixirBlog do
    pipe_through :browser # Use the default browser stack

    get "/login", AuthController, :login
    post "/login", AuthController, :do_login
    get "/logout", AuthController, :logout

    resources "/users", UserController
    resources "/", PostController
  end

end
