# ExWareki

Japanese era-converter for elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_wareki` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_wareki, "~> 1.0.0"}
  ]
end
```

## Parser

ExWareki provides some parsing algorithm for Japanese date format.

### Wareki (Japanese-formatted era) Parser

```elixir
iex> ExWareki.Parser.parse_wareki("令和元年九月十三日")
{:ok, %ExWareki.Structs.Wareki{name: "令和", yomi: "れいわ", year: 1, month: 9, day: 13}}
```

### Seireki (A.D. era) Parser

```elixir
iex> ExWareki.Parser.parse_seireki("2019年9月15日")
{:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}

iex> ExWareki.Parser.parse_seireki("二千十九年九月十五日")
{:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}

iex> ExWareki.Parser.parse_seireki("2019-9-15")
{:ok, %ExWareki.Structs.Seireki{year: 2019, month: 9, day: 15}}
```

## Conversion

Also, a converter is useful to transform date into another format.

### From Wareki To Seireki

You can convert an date formatted by Japanese era (wareki) into A.D. one (seireki):

```elixir
iex> ExWareki.Era.wareki2seireki(%ExWareki.Structs.Wareki{name: "平成", yomi: "へいせい", year: 1, month: 2, day: 13})
{:ok, %ExWareki.Structs.Seireki{year: 1989, month: 2, day: 13}}
```

### From Seireki To Wareki

You can also convert an date formatted by A.D. era (seireki) into Japanese one (wareki):

```elixir
iex> ExWareki.Era.seireki2wareki(%ExWareki.Structs.Seireki{year: 1989, month: 2, day: 13})
{:ok, %ExWareki.Structs.Wareki{name: "平成", yomi: "へいせい", year: 1, month: 2, day: 13}}
```

## References / Sources

本ツールで使用している元号は、以下のソースを基にしています。
近代を除く元号は、研究によって上書きされ得ることにご留意ください。

- [ウィキペディア - 元号一覧（日本）](https://ja.wikipedia.org/wiki/%E5%85%83%E5%8F%B7%E4%B8%80%E8%A6%A7_(%E6%97%A5%E6%9C%AC))

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
