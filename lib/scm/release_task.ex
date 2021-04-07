defmodule Scm.ReleaseTasks do
  @moduledoc """
  ReleaseTasks contains functions that needed
  to be use when release mix tasks
  """
  @app :scm

  alias Ecto.Migrator

  def migrate do
    IO.puts("Running migrations for #{@app}…")
    IO.puts(System.fetch_env!("MIX_ENV"))
    IO.puts(System.fetch_env!("DATABASE_PASSWORD"))
    IO.puts(System.fetch_env!("DATABASE_USERNAME"))
    IO.puts(System.fetch_env!("DATABASE_NAME"))
    IO.puts(System.fetch_env!("DATABASE_HOSTNAME"))
    IO.puts(System.fetch_env!("DATABASE_PORT"))
    IO.puts(System.fetch_env!("DATABASE_URL"))
    IO.puts(System.fetch_env!("SECRET_KEY_BASE"))

    for repo <- repos() do
      {:ok, _, _} = Migrator.with_repo(repo, &Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} = Migrator.with_repo(repo, &Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
