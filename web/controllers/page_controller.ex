defmodule PhoenixCrud.PageController do
  use Phoenix.Controller

  plug :action

  # pattern match againsts unauthorized params and redirect to 404 page

  def show(conn, %{"page" => "unauthorized"}) do
    conn
    |> put_layout(false)
    |> render "unauthorized.html"
  end

  def show(conn, %{"page" => page}) do
    render(conn, "show.html", page: page)
  end

  def test(conn, _params) do
    text conn, "Hello"
  end
end
