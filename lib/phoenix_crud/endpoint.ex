defmodule PhoenixCrud.Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_crud

  plug Plug.Static,
    at: "/", from: :phoenix_crud

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_phoenix_crud_key",
    signing_salt: "DMvYZyHU",
    encryption_salt: "BLo9jMYR"

  plug :router, PhoenixCrud.Router
end
