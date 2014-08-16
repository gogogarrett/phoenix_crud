use Mix.Config

config :phoenix, PhoenixCrud.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  code_reload: false,
  cookies: true,
  session_key: "_phoenix_crud_key",
  session_secret: "QXUDK*7!BP4119(IR_)95M3GTWD52X8DO3H0ONW&%HJ6)Z&ZIHJZ18E*NJ5G9IM((4S*1TQ_2G(C0"

config :phoenix, :logger,
  level: :error

