# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix_crud, PhoenixCrud.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KV4Z62miGXOyhHY8QgJJM9nlnEHHt4ACEQyH6tnvI4gK8+ZALcg0wkNQVJt2vYaL",
  debug_errors: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix_crud, PhoenixCrud.Repo,
  url: "ecto://username:password@localhost/phoenix_crud"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
