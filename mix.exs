defmodule Inari.Mixfile do
  use Mix.Project

  def project do
    [
      app: :inari,
      version: "1.0.0",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [espec: :test]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Inari.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Web Server
      {:plug, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      # Translation
      {:gettext, "~> 0.11"},
      # Parsing JSON
      {:poison, "~> 3.1"},
      # Inflections
      {:inflex, "~> 1.8.0"},

      # Development
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:espec, "~> 1.5.0", only: [:dev, :test]}
    ]
  end
end
