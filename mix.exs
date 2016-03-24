defmodule App.Mixfile do
  use Mix.Project

  def project do
    [app: :app,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {App, []},
     applications: applications(Mix.env)]
  end

  defp applications(:test) do
    [:hound | applications(:dev)]
  end

  defp applications(_) do
     [:phoenix, :phoenix_html, :cowboy, :logger, :gettext,
      :phoenix_ecto, :postgrex, :ex_aws, :httpoison]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:decimal, "1.1.1"},
     {:certifi, "0.4.0"},
     {:connection, "1.0.2"},
     {:db_connection, "~> 0.2"},
     {:ecto, "~> 1.1"},
     {:fs, "~> 0.9"},
     {:hackney, "1.5.7"},
     {:hound, "~> 0.7.6", only: :test},
     {:idna, "1.2.0"},
     {:mimerl, "1.0.2"},
     {:phoenix, "~> 1.1.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:poison, "1.5.2"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.3"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:plug, "~> 1.1.2"},
     {:poolboy, "1.5.1"},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:arc,  "~> 0.2.2"},
     {:arc_ecto, "~> 0.3.1"},
     {:ex_aws, "~> 0.4.10"},
     {:ssl_verify_fun, "1.1.0"},
     {:metrics, "1.0.1"},
     {:httpoison, "~> 0.7"}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
