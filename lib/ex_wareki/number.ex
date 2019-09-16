defmodule ExWareki.Number do
  @doc """
  parse/1 converts kansuji(kanji-number) into arabic numbers

    ## Examples

        iex> ExWareki.Number.parse(1234567890)
        {:ok, 1234567890}

        iex> ExWareki.Number.parse(012)
        {:ok, 12}

  """
  def parse(n) when is_number(n), do: {:ok, n}

  @doc """
  parse/1 converts kansuji(kanji-number) into arabic numbers

    ## Examples

        iex> ExWareki.Number.parse("1234567890")
        {:ok, 1234567890}

        iex> ExWareki.Number.parse("012")
        {:ok, 012}

  """
  def parse(str_n) do
    case String.match?(str_n, ~r/[0-9]+/) do
      true ->
        {:ok, String.to_integer(str_n)}
      false ->
        kansuji2arabic(str_n)
    end
  end

  def parse!(v) do
    case parse(v) do
      {:ok, r} -> r
      {:error, _} -> raise "cannot parse value to number: #{v}"
    end
  end

  def kansuji2arabic("零"), do: {:ok, 0}
  def kansuji2arabic("元"), do: {:ok, 1}
  def kansuji2arabic("一"), do: {:ok, 1}
  def kansuji2arabic("二"), do: {:ok, 2}
  def kansuji2arabic("三"), do: {:ok, 3}
  def kansuji2arabic("四"), do: {:ok, 4}
  def kansuji2arabic("五"), do: {:ok, 5}
  def kansuji2arabic("六"), do: {:ok, 6}
  def kansuji2arabic("七"), do: {:ok, 7}
  def kansuji2arabic("八"), do: {:ok, 8}
  def kansuji2arabic("九"), do: {:ok, 9}
  def kansuji2arabic("十"), do: {:ok, 10}
  def kansuji2arabic("百"), do: {:ok, 100}
  def kansuji2arabic("千"), do: {:ok, 1000}
  def kansuji2arabic("万"), do: {:ok, 10000}
  def kansuji2arabic("億"), do: {:ok, 100000000}

  @doc """
  kansuji2arabic/1 converts kansuji(kanji-number) into arabic numbers

    ## Examples

        iex> ExWareki.Number.kansuji2arabic("五億四千六百三十一万九千八百二十一")
        {:ok, 546319821}

        iex> ExWareki.Number.kansuji2arabic("十三")
        {:ok, 13}

        iex> ExWareki.Number.kansuji2arabic("二千十九")
        {:ok, 2019}

        iex> ExWareki.Number.kansuji2arabic("十万百十")
        {:ok, 100110}

  """
  def kansuji2arabic(kansuji) do
    n =
      String.codepoints(kansuji)
      |> Enum.map(fn x -> kansuji2arabic!(x) end)
      |> reduce_numbers()

    {:ok, n}
  end

  defp reduce_numbers(numbers) do
    numbers
    |> Enum.reduce(%{stack: [], sum: 0, cont_unit: false}, fn (v, acc) -> reduce_base(v, acc) end)
    |> sum_up()
  end

  defp sum_up(%{stack: stack, sum: sum}) do
    ds = stack |> Enum.sum
    sum + ds
  end

  defp reduce_base(v, %{stack: stack, sum: sum, cont_unit: cont_unit}) do
    cond do
      v >= 10000 ->
        ds = stack |> Enum.sum()
        %{stack: [], sum: sum + ds * v, cont_unit: false}
      v >= 10 ->
        case length(stack) do
          0 ->
            %{stack: [v], sum: sum, cont_unit: true}
          _ ->
            [head | tail] = stack
            case cont_unit do
              true ->
                %{stack: [v + head | tail], sum: sum, cont_unit: true}
              false ->
                %{stack: [head * v] ++ tail, sum: sum, cont_unit: true}
            end
        end
      true ->
        %{stack: [v] ++ stack, sum: sum, cont_unit: false}
    end
  end

  @doc """
  kansuji2arabic!/1 converts kansuji(kanji-number) into arabic numbers

    ## Examples

        iex> ExWareki.Number.kansuji2arabic!("五億四千六百三十一万九千八百二十一")
        546319821

  """
  def kansuji2arabic!(kansuji) do
    case kansuji2arabic(kansuji) do
      {:ok, n} -> n
      {:error, _} -> raise "cannot convert kansuji(kanji-number) into arabic numbers"
    end
  end
end