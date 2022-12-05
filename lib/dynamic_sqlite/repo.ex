defmodule DynamicSqlite.Repo do
  use Ecto.Repo,
    otp_app: :experiment,
    adapter: Ecto.Adapters.SQLite3

  def init(_type, config) do
    case System.get_env("SQLITE_FILE") do
      nil -> {:error, "No SQLITE_FILE in environment"}
      file -> {:ok, Keyword.put(config, :database, file)}
    end
  end
end
