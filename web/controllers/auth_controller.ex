defmodule ElixirBlog.AuthController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def do_login(conn, %{"login" => %{"username" => username, "password" => password}}) do
    conn = put_session(conn, :username, username)
    |> redirect(to: post_path(conn, :index))
  end

  def logout(conn, _params) do
    conn = delete_session(conn, :username)
    |> render("logout.html")
  end

end
