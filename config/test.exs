use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app, App.Endpoint,
  http: [port: 4001],
  server: true

config :hound,
  driver: "chrome_driver",
  app_host: "http://localhost",
  app_port: 4001

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :app, App.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "password",
  database: "app_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox
