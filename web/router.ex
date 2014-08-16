defmodule PhoenixCrud.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :phoenix_crud

  scope alias: PingPong do
    get "/", WelcomeController, :index, as: :root
  end
end
