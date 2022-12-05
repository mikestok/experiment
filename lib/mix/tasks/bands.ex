defmodule Mix.Tasks.Bands do
  use Mix.Task

  def run(_) do
    Application.ensure_all_started(:experiment)

    Band
    |> DynamicSqlite.Repo.all()
    |> Enum.map(& &1.name)
    |> IO.inspect()
  end
end
