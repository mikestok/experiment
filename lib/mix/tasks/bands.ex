defmodule Mix.Tasks.Bands do
  use Mix.Task

  def run(_) do
    Application.ensure_all_started(:experiment)
    Logger.configure(level: :error)

    "dbs/*.db"
    |> Path.wildcard()
    |> Enum.map(&to_sqlite_url(&1, mode: "ro", immutable: 1))
    |> Enum.each(fn url ->
      IO.puts("Using #{url}")
      DynamicSqlite.Repo.using_file(url, &list_bands/0)
    end)
  end

  defp list_bands() do
    Band
    |> DynamicSqlite.Repo.all()
    |> Enum.map(& &1.name)
    |> IO.inspect()
  end

  defp to_sqlite_url(filename, opts) do
    URI.to_string(%URI{
      scheme: "file",
      path: filename,
      query: URI.encode_query(opts)
    })
  end
end
