defmodule ExWareki.Structs.Wareki do
  defstruct name: "", yomi: "", year: -1, month: -1, day: -1

  @type t(name, yomi, year, month, day) :: %ExWareki.Structs.Wareki{name: name, yomi: yomi, year: year, month: month, day: day}
  @type t :: %ExWareki.Structs.Wareki{name: string, yomi: string, year: integer, month: integer, day: integer}
end