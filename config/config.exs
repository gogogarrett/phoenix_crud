# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, PhoenixCrud.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  static_assets: true,
  cookies: true,
  session_key: "_phoenix_crud_key",
  session_secret: "QXUDK*7!BP4119(IR_)95M3GTWD52X8DO3H0ONW&%HJ6)Z&ZIHJZ18E*NJ5G9IM((4S*1TQ_2G(C0"

config :phoenix, :logger,
  level: :error


# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
