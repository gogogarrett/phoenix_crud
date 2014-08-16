defmodule PhoenixCrud.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :phoenix_crud
  get "/", PhoenixCrud.PageController, :index, as: :page
end
