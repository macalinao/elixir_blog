defmodule ElixirBlog.AuthController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  plug :scrub_params, "post" when action in [:create, :update]

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def do_login(conn, %{"username" => username, "password" => password}) do
    redirect(conn, to: post_path(conn, :index))
  end

  def logout(conn, _params) do
    render(conn, "logout.html")
  end

end
