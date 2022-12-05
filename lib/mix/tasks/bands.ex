defmodule Mix.Tasks.Bands do
  use Mix.Task

  def run(_) do
    Application.ensure_all_started(:experiment)
    Logger.configure(level: :error)

    "dbs/*.db"
    |> Path.wildcard()
    |> Enum.each(fn filename ->
      IO.puts("Using #{filename}")
      DynamicSqlite.Repo.using_file(filename, &list_bands/0)
    end)
  end

  defp list_bands() do
    Band
    |> DynamicSqlite.Repo.all()
    |> Enum.map(& &1.name)
    |> IO.inspect()
  end
end
