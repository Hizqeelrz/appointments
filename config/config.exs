# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :appointment,
  ecto_repos: [Appointment.Repo]

# Configures the endpoint
config :appointment, AppointmentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AYQmnH8moeK3EKQaKFEqwKWyZAXF0oU/jDyMv31USMZaX6DKozKQiyFzIXJ9RajM",
  render_errors: [view: AppointmentWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Appointment.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :Appointment, Appointment.Guardian,
       issuer: "Appointment",
       secret_key: "s7jdGWs3yxo1daHGziSbo0067wga+gGUYpc384vm0mXKt03HUmNtk+ldodhfZ410"
