# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configures the endpoint
config :auction_web, AuctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qVY/NATAHdLndhgZXQSkmZ2cQo66w7nGunOIVpzt51tc/KCAnmD53CYfSv8FZMBw",
  render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AuctionWeb.PubSub,
  live_view: [signing_salt: "iI7Q8qlr"]

config :auction_web,
  generators: [context_app: false]

# Configures ecto
config :auction, ecto_repos: [Auction.Repo]

config :auction, Auction.Repo,
  database: "auction",
  username: "postgres",
  password: "",
  hostname: "localhost",
  port: "5432"

# Configures the endpoint
# config :auction_web, AuctionWeb.Endpoint,
#   url: [host: "localhost"],
#   secret_key_base: "8EKTaD8OUEPMpDy9L9wZj06dKbUVOhDwUSRq0XGGrKcKEtwKFRQMBf3qvPP73B4T",
#   render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json), layout: false],
#   pubsub_server: AuctionWeb.PubSub,
#   live_view: [signing_salt: "XzS+ADmb"]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
