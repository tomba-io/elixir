defmodule Tomba.MixProject do
  use Mix.Project

  @version "1.0.1"
  @source_url "https://github.com/tomba-io/elixir"

  def project do
    [
      app: :tomba,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "Tomba",
      description: "Official Elixir client library for the Tomba Email Finder API",
      docs: docs(),
      homepage_url: "https://tomba.io/",
      source_url: @source_url,
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:mox, "~> 1.0", only: :test}
    ]
  end

  defp package do
    [
      name: :tomba,
      files: ["lib", "mix.exs", "README.md", "LICENSE", ".formatter.exs"],
      maintainers: ["Mohamed Ben rebia <b.mohamed@tomba.io>"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url,
        "Documentation" => "https://docs.tomba.io",
        "API Reference" => "https://docs.tomba.io/api/introduction"
      }
    ]
  end

  defp docs do
    [
      main: "Tomba",
      extras: ["README.md", "LICENSE"],
      source_ref: "v#{@version}",
      source_url: @source_url,
      groups_for_modules: [
        Core: [Tomba, Tomba.Client, Tomba.Error],
        "Search & Lookup": [Tomba.Domain, Tomba.Finder, Tomba.Count, Tomba.Sources, Tomba.Format],
        Verification: [Tomba.Verifier, Tomba.Phone],
        Enrichment: [Tomba.Enrichment],
        "Domain Info": [Tomba.Status, Tomba.Similar, Tomba.Technology, Tomba.Location],
        Account: [Tomba.Account, Tomba.Usage, Tomba.Logs, Tomba.Keys],
        "Leads & CRM": [Tomba.Leads, Tomba.LeadsLists, Tomba.LeadsAttributes],
        Bulk: [Tomba.Bulk],
        Other: [Tomba.Flag, Tomba.Reveal]
      ]
    ]
  end

  defp aliases do
    [
      lint: ["format --check-formatted", "credo --strict"]
    ]
  end
end
