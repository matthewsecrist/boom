defmodule Boom.MixProject do
  use Mix.Project

  def project do
    [
      app: :boom,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Boom",
      source_url: "https://github.com/matthewsecrist/boom",
      homepage_url: "https://github.com/matthewsecrist/boom"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.23.0", only: :dev},
      {:inner_cotton, "~> 0.6", only: [:dev, :test]}
    ]
  end

  defp description() do
    "`Boom` is inspired by the NodeJS package `@hapi/boom`, allowing you to respond with json errors easily."
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/matthewsecrist/boom"}
    ]
  end
end
