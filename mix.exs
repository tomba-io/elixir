defmodule Tomba.MixProject do
  use Mix.Project

  def project do
    [
      app: :tomba,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Official elixir client library for Tomba email finder",
      docs: [extras: ["README.md"]],
      homepage_url: " https://tomba.io/",
      source_url: "https://github.com/tomba-io/elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpotion]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpotion, "~> 3.1.0"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :tomba,
      files: ["lib/*", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Mohamed Ben rebia <b.mohamed@tomba.io>"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/tomba-io/elixir"}
    ]
  end
end
