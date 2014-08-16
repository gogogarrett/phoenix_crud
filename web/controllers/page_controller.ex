defmodule PhoenixCrud.PageController do
  use Phoenix.Controller

  def show(conn, %{"page" => "unauthorized"}) do
    # [g] idk why this template won't render?
    # render conn, "unauthorized"

    html conn, """
      <html>
        <head>
          <title>404 Page not found.</title>
        </head>
        <body>
          <h1> Page not found! </h1>
        </body>
      </html>
    """
  end
end
