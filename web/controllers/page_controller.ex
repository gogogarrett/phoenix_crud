defmodule PhoenixCrud.PageController do
  use Phoenix.Controller

  def show(conn, %{"page" => "unauthorized"}) do
    render conn, "unauthorized"
  end
end
