defmodule ElixirBlog.AuthController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def do_login(conn, %{"login" => %{"username" => username, "password" => password}}) do
    redirect(conn, to: post_path(conn, :index))
  end

  def logout(conn, _params) do
    render(conn, "logout.html")
  end

end
