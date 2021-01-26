defmodule Scm.Repo do
  use Ecto.Repo,
    otp_app: :scm,
    adapter: Ecto.Adapters.Postgres
end
