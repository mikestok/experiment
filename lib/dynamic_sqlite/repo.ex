defmodule DynamicSqlite.Repo do
  use Ecto.Repo,
    otp_app: :experiment,
    adapter: Ecto.Adapters.SQLite3


  def using_file(filename, callback) do
    start_opts = [name: nil, pool_size: 1, database: filename]

    {:ok, repo} = __MODULE__.start_link(start_opts)

    try do
      __MODULE__.put_dynamic_repo(repo)
      callback.()
    after
      Supervisor.stop(repo)
    end
  end
end
