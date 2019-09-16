defmodule ExWareki.Era do
  alias ExWareki.Data
  alias ExWareki.Structs.Wareki
  alias ExWareki.Structs.Seireki

  @doc """
  search_wareki_by_name/1 finds an era by name

    ## Examples

        iex> ExWareki.Era.search_wareki_by_name("平成")
        %{name: "平成", yomi: "へいせい", begin_year: 1989, begin_month: 1, begin_day: 8, end_year: 2019, end_month: 4, end_day: 30}

  """
  def search_wareki_by_name(query) do
    Data.data()
    |> Enum.filter(fn d -> d.name == query end)
    |> List.first
  end

  @doc """
  wareki2seireki/1 converts wareki struct into seireki struct

    ## Examples

        iex> ExWareki.Era.wareki2seireki(%ExWareki.Structs.Wareki{name: "平成", yomi: "へいせい", year: 1, month: 2, day: 13})
        {:ok, %ExWareki.Structs.Seireki{year: 1989, month: 2, day: 13}}

  """
  def wareki2seireki(%Wareki{} = wareki) do
    case search_wareki_by_name(wareki.name) do
      nil -> {:error, "cannot find wareki: #{wareki.name}"}
      data ->
        {:ok, %Seireki{
          year: data.begin_year + wareki.year - 1,
          month: wareki.month,
          day: wareki.day,
        }}
    end
  end

  @doc """
  seireki2wareki/1 converts seireki struct into wareki struct

    ## Examples

        iex> ExWareki.Era.seireki2wareki(%ExWareki.Structs.Seireki{year: 1989, month: 2, day: 13})
        {:ok, %ExWareki.Structs.Wareki{name: "平成", yomi: "へいせい", year: 1, month: 2, day: 13}}

        iex> ExWareki.Era.seireki2wareki(%ExWareki.Structs.Seireki{year: 2019, month: 9, day: 13})
        {:ok, %ExWareki.Structs.Wareki{name: "令和", yomi: "れいわ", year: 1, month: 9, day: 13}}

        iex> ExWareki.Era.seireki2wareki(%ExWareki.Structs.Seireki{year: 0, month: 1, day: 1})
        {:error, %ExWareki.Structs.Wareki{name: "【元号不明】", yomi: "", year: 0, month: 1, day: 1}}

  """
  def seireki2wareki(%Seireki{} = seireki) do
    Data.data()
    |> Enum.filter(fn d -> compare_date(seireki.year, seireki.month, seireki.day, d.begin_year, d.begin_month, d.begin_day) >= 0 end)
    |> List.last
    |> compose_wareki(seireki)
  end

  defp compose_wareki(nil, seireki) do
    {:error, %Wareki{
      name: "【元号不明】",
      yomi: "",
      year: seireki.year,
      month: seireki.month,
      day: seireki.day,
    }}
  end

  defp compose_wareki(era, seireki) do
    {:ok, %Wareki{
      name: era.name,
      yomi: era.yomi,
      year: seireki.year - era.begin_year + 1,
      month: seireki.month,
      day: seireki.day,
    }}
  end


  @doc """
  compare_date/6 returns
     1 if date1 > date2,
    -1 if date1 < date2,
     0 if date1 = date2

    ## Examples

        iex> ExWareki.Era.compare_date(2019, 12, 31, 2017, 1, 4)
        1

        iex> ExWareki.Era.compare_date(2019, 1, 5, 2019, 1, 4)
        1

        iex> ExWareki.Era.compare_date(2019, 1, 5, 2019, 1, 5)
        0

        iex> ExWareki.Era.compare_date(2018, 1, 5, 2019, 1, 5)
        -1

  """
  defp compare_date(year1, month1, day1, year2, month2, day2) do
    cond do
      year1  > year2  ->  1
      year1  < year2  -> -1
      month1 > month2 ->  1
      month1 < month2 -> -1
      day1   > day2   ->  1
      day1   < day2   -> -1
      true            ->  0
    end
  end

end