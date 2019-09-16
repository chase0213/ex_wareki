defmodule ExWareki.MixProject do
  use Mix.Project

  @description """
    Japanese era-converter for elixir
  """

  def project do
    [
      app: :ex_wareki,
      version: "1.0.0",
      elixir: "~> 1.9",
      name: "ex_wareki",
      description: @description,
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, "~> 0.11"},
      {:earmark, ">= 0.0.0"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      maintainers: [
        "chase0213+dev@gmail.com",
      ],
      licenses: ["MIT"],
      links: %{
        "Github": "https://github.com/chase0213/ex_wareki"
      }
    ]
  end
end
