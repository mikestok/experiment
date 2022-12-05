import Config

config :experiment, DynamicSqlite.Repo, []

# Shrug. As usual Elixir is a series of increasingly annoying paper cuts.
config :logger, level: :error
