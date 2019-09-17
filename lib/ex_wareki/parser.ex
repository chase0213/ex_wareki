defmodule ExWareki.Parser do
  @moduledoc """
  Parser module provides parsers of Japanese-formatted date string.
  """

  alias ExWareki.Era
  alias ExWareki.Structs.Wareki
  alias ExWareki.Structs.Seireki
  alias ExWareki.Number

  @doc """
  parse_wareki/1 parses wareki string

    ## Examples

        iex> ExWareki.Parser.parse_wareki("令和元年九月十三日")
        {:ok, %ExWareki.Structs.Wareki{name: "令和", yomi: "れいわ", year: 1, month: 9, day: 13}}

  """
  def parse_wareki(wareki_str) do
    nengo =
      Regex.split(~r/(一|二|三|四|五|六|七|八|九|十|百|千|零|元|[0-9])+/, wareki_str)
      |> List.first
      |> Era.search_wareki_by_name

    exp = Regex.compile!(nengo.name <> "|/|,|-|\\s|年|月|日")
    dates = Regex.split(exp, wareki_str)

    case dates do
      [_, year, month, day, _] ->
        {:ok, %Wareki{
          name: nengo.name,
          yomi: nengo.yomi,
          year: Number.parse!(year),
          month: Number.parse!(month),
          day: Number.parse!(day),
        }}
      _ ->
        {:error, "cannot parse string: #{wareki_str}"}
    end
  end

  @doc """
  parse_seireki/1 parses seireki string


    ## Examples

        iex> ExWareki.Parser.parse_seireki("2019年9月15日")
        {:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}

        iex> ExWareki.Parser.parse_seireki("二千十九年九月十五日")
        {:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}

        iex> ExWareki.Parser.parse_seireki("2019-9-15")
        {:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}

  """
  def parse_seireki(seireki_str) do
    exp = Regex.compile!("/|,|-|\\s|年|月|日")
    dates = Regex.split(exp, seireki_str)

    case dates do
      [year, month, day, _] ->
        {:ok, %Seireki{
          year: Number.parse!(year),
          month: Number.parse!(month),
          day: Number.parse!(day),
        }}
      [year, month, day] ->
        {:ok, %Seireki{
          year: Number.parse!(year),
          month: Number.parse!(month),
          day: Number.parse!(day),
        }}
      _ ->
        {:error, "cannot parse string: #{seireki_str}"}
    end
  end
end