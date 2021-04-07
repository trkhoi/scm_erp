# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """
  |> IO.inspect()
  

config :scm, Scm.Repo,
  # ssl: true,
  url: database_url,
  username: "qbuwsigmgffprs",
  password: "9b95b6d254746854f60c6e6aae101cc48ec8df9dcac80300ef532666df4ec39b",
  database: "dfbc8tslcs6caf",
  hostname: "ec2-52-22-161-59.compute-1.amazonaws.com",
  show_sensitive_data_on_connection_error: true,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
  # in microseconds, defaults to 50
  queue_target: 3000,
  # in microseconds, defaults to 1000
  queue_interval: 6000

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :scm, ScmWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :scm, ScmWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
