defmodule Ketchup.MixProject do
  use Mix.Project

  def project do
    [
      app: :ketchup,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ketchup.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:riak_core, github: "basho/riak_core", branch: "develop-3.0-travisci"},
      {:cuttlefish, github: "basho/cuttlefish", tag: "2.0.11", manager: :rebar3, override: true},
      {:lager, ~r/.*/, github: "basho/lager", tag: "3.2.4", manager: :rebar3, override: true},
      {:goldrush, ~r/.*/, github: "basho/goldrush", tag: "0.1.9", manager: :rebar3, override: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
