defmodule ExWareki.DataTest do
  use ExUnit.Case
  doctest ExWareki.Data

  alias ExWareki.Data

  test "raw_data/1" do
    raw_data = Data.raw_data()
    assert length(raw_data) == 238

    heisei = Enum.at(raw_data, 236)
    assert heisei.begin_at == "1989-1-8"
    assert heisei.end_at == "2019-4-30"
    assert heisei.name == "平成"
    assert heisei.yomi == "へいせい"
  end

  test "data/1" do
    data = Data.data()
    assert length(data) == 238

    heisei = Enum.at(data, 236)
    assert heisei.begin_year == 1989
    assert heisei.begin_month == 1
    assert heisei.begin_day == 8
    assert heisei.end_year == 2019
    assert heisei.end_month == 4
    assert heisei.end_day == 30
    assert heisei.name == "平成"
    assert heisei.yomi == "へいせい"
  end
end