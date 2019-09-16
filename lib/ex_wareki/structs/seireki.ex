defmodule ExWareki.Structs.Seireki do
  defstruct year: -1, month: -1, day: -1

  @type t(year, month, day) :: %ExWareki.Structs.Seireki{year: year, month: month, day: day}
  @type t :: %ExWareki.Structs.Seireki{year: integer, month: integer, day: integer}
end