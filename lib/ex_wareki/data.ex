defmodule ExWareki.Data do
  @moduledoc """
  Data module is a storage of era-data. You may not need to use this module directly.
  """

  def data() do
    raw_data()
    |> Enum.map(fn d -> parse(d) end)
  end

  @doc """
  str2date/1 converts date-string into date struct

  ## Examples

      iex> ExWareki.Data.str2date("2019-09-13")
      %{year: 2019, month: 9, day: 13}

      iex> ExWareki.Data.str2date("-")
      %{year: -1, month: -1, day: -1}

      iex> ExWareki.Data.str2date("2019-03")
      %{year: -1, month: -1, day: -1}

  """
  def str2date(str_date) do
    date_array = String.split(str_date, "-")
    case length(date_array) do
      3 ->
        [year, month, day] = date_array
        %{
          year: String.to_integer(year),
          month: String.to_integer(month),
          day: String.to_integer(day),
        }
      _ ->
        %{year: -1, month: -1, day: -1}
    end
  end

  @doc """
  parse/1 converts an entity of raw_data into data

  ## Examples

      iex> ExWareki.Data.parse(%{name: "平成", yomi: "へいせい", begin_at: "1989-1-8", end_at: "2019-5-1"})
      %{name: "平成", yomi: "へいせい", begin_year: 1989, begin_month: 1, begin_day: 8, end_year: 2019, end_month: 5, end_day: 1}

  """
  def parse(data) do
    begin_at = str2date(data.begin_at)
    end_at = str2date(data.end_at)

    %{
      name: data.name,
      yomi: data.yomi,
      begin_year: begin_at.year,
      begin_month: begin_at.month,
      begin_day: begin_at.day,
      end_year: end_at.year,
      end_month: end_at.month,
      end_day: end_at.day,
    }
  end

  def raw_data() do
    [
      %{
        name:    "白雉",
        yomi:    "はくち",
        begin_at: "650-3-22",
        end_at:   "654-11-24",
      },
      %{
        name:    "－",
        yomi:    "－",
        begin_at: "654-11-24",
        end_at:   "686-8-14",
      },
      %{
        name:    "朱鳥",
        yomi:    "しゅちょう",
        begin_at: "686-8-14",
        end_at:   "686-10-1",
      },
      %{
        name:    "－",
        yomi:    "－",
        begin_at: "686-10-1",
        end_at:   "701-5-3",
      },
      %{
        name:    "大宝",
        yomi:    "たいほう",
        begin_at: "701-5-3",
        end_at:   "704-6-16",
      },
      %{
        name:    "慶雲",
        yomi:    "けいうん",
        begin_at: "704-6-16",
        end_at:   "708-2-7",
      },
      %{
        name:    "和銅",
        yomi:    "わどう",
        begin_at: "708-2-7",
        end_at:   "715-10-3",
      },
      %{
        name:    "養老",
        yomi:    "ようろう",
        begin_at: "717-12-24",
        end_at:   "724-3-3",
      },
      %{
        name:    "神亀",
        yomi:    "じんき",
        begin_at: "724-3-3",
        end_at:   "729-9-2",
      },
      %{
        name:    "天平",
        yomi:    "てんぴょう",
        begin_at: "729-9-2",
        end_at:   "749-5-4",
      },
      %{
        name:    "天平感宝",
        yomi:    "てんぴょうかんぽう",
        begin_at: "749-5-4",
        end_at:   "749-8-19",
      },
      %{
        name:    "天平勝宝",
        yomi:    "てんぴょうしょうほう",
        begin_at: "749-8-19",
        end_at:   "757-9-6",
      },
      %{
        name:    "天平宝字",
        yomi:    "てんぴょうほうじ",
        begin_at: "757-9-6",
        end_at:   "765-2-1",
      },
      %{
        name:    "天平神護",
        yomi:    "てんぴょうじんご",
        begin_at: "765-2-1",
        end_at:   "767-9-13",
      },
      %{
        name:    "神護景雲",
        yomi:    "じんごけいうん",
        begin_at: "767-9-13",
        end_at:   "770-10-23",
      },
      %{
        name:    "宝亀",
        yomi:    "ほうき",
        begin_at: "770-10-23",
        end_at:   "781-1-30",
      },
      %{
        name:    "天応",
        yomi:    "てんおう",
        begin_at: "781-1-30",
        end_at:   "782-9-30",
      },
      %{
        name:    "延暦",
        yomi:    "えんりゃく",
        begin_at: "782-9-30",
        end_at:   "806-6-8",
      },
      %{
        name:    "弘仁",
        yomi:    "こうにん",
        begin_at: "810-10-20",
        end_at:   "824-2-8",
      },
      %{
        name:    "天長",
        yomi:    "てんちょう",
        begin_at: "824-2-8",
        end_at:   "834-2-14",
      },
      %{
        name:    "承和",
        yomi:    "じょうわ",
        begin_at: "834-2-14",
        end_at:   "848-7-16",
      },
      %{
        name:    "嘉祥",
        yomi:    "かしょう",
        begin_at: "848-7-16",
        end_at:   "851-6-1",
      },
      %{
        name:    "仁寿",
        yomi:    "にんじゅ",
        begin_at: "851-6-1",
        end_at:   "854-12-23",
      },
      %{
        name:    "斉衡",
        yomi:    "さいこう",
        begin_at: "854-12-23",
        end_at:   "857-3-20",
      },
      %{
        name:    "天安",
        yomi:    "てんあん",
        begin_at: "857-3-20",
        end_at:   "859-5-20",
      },
      %{
        name:    "貞観",
        yomi:    "じょうがん",
        begin_at: "859-5-20",
        end_at:   "877-6-1",
      },
      %{
        name:    "元慶",
        yomi:    "がんぎょう",
        begin_at: "877-6-1",
        end_at:   "885-3-11",
      },
      %{
        name:    "仁和",
        yomi:    "にんな",
        begin_at: "885-3-11",
        end_at:   "889-5-30",
      },
      %{
        name:    "寛平",
        yomi:    "かんぴょう",
        begin_at: "889-5-30",
        end_at:   "898-5-2",
      },
      %{
        name:    "昌泰",
        yomi:    "しょうたい",
        begin_at: "898-5-20",
        end_at:   "901-8-31",
      },
      %{
        name:    "延喜",
        yomi:    "えんぎ",
        begin_at: "901-8-31",
        end_at:   "923-5-29",
      },
      %{
        name:    "延長",
        yomi:    "えんちょう",
        begin_at: "923-5-29",
        end_at:   "931-5-16",
      },
      %{
        name:    "承平",
        yomi:    "じょうへい",
        begin_at: "931-5-16",
        end_at:   "938-6-22",
      },
      %{
        name:    "天慶",
        yomi:    "てんぎょう",
        begin_at: "938-6-22",
        end_at:   "947-5-15",
      },
      %{
        name:    "天暦",
        yomi:    "てんりゃく",
        begin_at: "947-5-15",
        end_at:   "957-11-21",
      },
      %{
        name:    "天徳",
        yomi:    "てんとく",
        begin_at: "957-11-21",
        end_at:   "961-3-5",
      },
      %{
        name:    "応和",
        yomi:    "おうわ",
        begin_at: "961-3-5",
        end_at:   "964-8-19",
      },
      %{
        name:    "康保",
        yomi:    "こうほう",
        begin_at: "964-8-19",
        end_at:   "968-9-8",
      },
      %{
        name:    "安和",
        yomi:    "あんな",
        begin_at: "968-9-8",
        end_at:   "970-5-3",
      },
      %{
        name:    "天禄",
        yomi:    "てんろく",
        begin_at: "970-5-3",
        end_at:   "974-1-16",
      },
      %{
        name:    "天延",
        yomi:    "てんえん",
        begin_at: "974-1-16",
        end_at:   "976-8-11",
      },
      %{
        name:    "貞元",
        yomi:    "じょうげん",
        begin_at: "976-8-11",
        end_at:   "978-12-31",
      },
      %{
        name:    "天元",
        yomi:    "てんげん",
        begin_at: "978-12-31",
        end_at:   "983-5-29",
      },
      %{
        name:    "永観",
        yomi:    "えいかん",
        begin_at: "983-5-29",
        end_at:   "985-5-19",
      },
      %{
        name:    "寛和",
        yomi:    "かんな",
        begin_at: "985-5-19",
        end_at:   "987-5-5",
      },
      %{
        name:    "永延",
        yomi:    "えいえん",
        begin_at: "987-5-5",
        end_at:   "989-9-10",
      },
      %{
        name:    "永祚",
        yomi:    "えいそ",
        begin_at: "989-9-10",
        end_at:   "990-11-26",
      },
      %{
        name:    "正暦",
        yomi:    "しょうりゃく",
        begin_at: "990-11-26",
        end_at:   "995-3-25",
      },
      %{
        name:    "長徳",
        yomi:    "ちょうとく",
        begin_at: "995-3-25",
        end_at:   "999-2-1",
      },
      %{
        name:    "長保",
        yomi:    "ちょうほう",
        begin_at: "999-2-1",
        end_at:   "1004-8-8",
      },
      %{
        name:    "寛弘",
        yomi:    "かんこう",
        begin_at: "1004-8-8",
        end_at:   "1013-2-8",
      },
      %{
        name:    "長和",
        yomi:    "ちょうわ",
        begin_at: "1013-2-8",
        end_at:   "1017-5-21",
      },
      %{
        name:    "寛仁",
        yomi:    "かんにん",
        begin_at: "1017-5-21",
        end_at:   "1021-3-17",
      },
      %{
        name:    "治安",
        yomi:    "じあん",
        begin_at: "1021-3-17",
        end_at:   "1024-8-19",
      },
      %{
        name:    "万寿",
        yomi:    "まんじゅ",
        begin_at: "1024-8-19",
        end_at:   "1028-8-18",
      },
      %{
        name:    "長元",
        yomi:    "ちょうげん",
        begin_at: "1028-8-18",
        end_at:   "1037-5-9",
      },
      %{
        name:    "長暦",
        yomi:    "ちょうりゃく",
        begin_at: "1037-5-9",
        end_at:   "1040-12-16",
      },
      %{
        name:    "長久",
        yomi:    "ちょうきゅう",
        begin_at: "1040-12-16",
        end_at:   "1044-12-16",
      },
      %{
        name:    "寛徳",
        yomi:    "かんとく",
        begin_at: "1044-12-16",
        end_at:   "1046-5-22",
      },
      %{
        name:    "永承",
        yomi:    "えいしょう",
        begin_at: "1046-5-22",
        end_at:   "1053-2-2",
      },
      %{
        name:    "天喜",
        yomi:    "てんき",
        begin_at: "1053-2-2",
        end_at:   "1058-9-19",
      },
      %{
        name:    "康平",
        yomi:    "こうへい",
        begin_at: "1058-9-19",
        end_at:   "1065-9-4",
      },
      %{
        name:    "治暦",
        yomi:    "じりゃく",
        begin_at: "1065-9-4",
        end_at:   "1069-5-6",
      },
      %{
        name:    "延久",
        yomi:    "えんきゅう",
        begin_at: "1069-5-6",
        end_at:   "1074-9-16",
      },
      %{
        name:    "承保",
        yomi:    "じょうほう",
        begin_at: "1074-9-16",
        end_at:   "1077-12-5",
      },
      %{
        name:    "承暦",
        yomi:    "じょうりゃく",
        begin_at: "1077-12-5",
        end_at:   "1081-3-22",
      },
      %{
        name:    "永保",
        yomi:    "えいほう",
        begin_at: "1081-3-22",
        end_at:   "1084-3-15",
      },
      %{
        name:    "応徳",
        yomi:    "おうとく",
        begin_at: "1084-3-15",
        end_at:   "1087-5-11",
      },
      %{
        name:    "寛治",
        yomi:    "かんじ",
        begin_at: "1087-5-11",
        end_at:   "1095-1-23",
      },
      %{
        name:    "嘉保",
        yomi:    "かほう",
        begin_at: "1095-1-23",
        end_at:   "1097-1-3",
      },
      %{
        name:    "永長",
        yomi:    "えいちょう",
        begin_at: "1097-1-3",
        end_at:   "1097-12-27",
      },
      %{
        name:    "承徳",
        yomi:    "じょうとく",
        begin_at: "1097-12-27",
        end_at:   "1099-9-15",
      },
      %{
        name:    "康和",
        yomi:    "こうわ",
        begin_at: "1099-9-15",
        end_at:   "1104-3-8",
      },
      %{
        name:    "長治",
        yomi:    "ちょうじ",
        begin_at: "1104-3-8",
        end_at:   "1106-5-13",
      },
      %{
        name:    "嘉承",
        yomi:    "かしょう",
        begin_at: "1106-5-13",
        end_at:   "1108-9-9",
      },
      %{
        name:    "天仁",
        yomi:    "てんにん",
        begin_at: "1108-9-9",
        end_at:   "1110-7-31",
      },
      %{
        name:    "天永",
        yomi:    "てんえい",
        begin_at: "1110-7-31",
        end_at:   "1113-8-25",
      },
      %{
        name:    "永久",
        yomi:    "えいきゅう",
        begin_at: "1113-8-25",
        end_at:   "1118-4-25",
      },
      %{
        name:    "元永",
        yomi:    "げんえい",
        begin_at: "1118-4-25",
        end_at:   "1120-5-9",
      },
      %{
        name:    "保安",
        yomi:    "ほうあん",
        begin_at: "1120-5-9",
        end_at:   "1124-5-18",
      },
      %{
        name:    "天治",
        yomi:    "てんじ",
        begin_at: "1124-5-18",
        end_at:   "1126-2-15",
      },
      %{
        name:    "大治",
        yomi:    "だいじ",
        begin_at: "1126-2-15",
        end_at:   "1131-2-28",
      },
      %{
        name:    "天承",
        yomi:    "てんしょう",
        begin_at: "1131-2-28",
        end_at:   "1132-9-21",
      },
      %{
        name:    "長承",
        yomi:    "ちょうしょう",
        begin_at: "1132-9-21",
        end_at:   "1135-6-10",
      },
      %{
        name:    "保延",
        yomi:    "ほうえん",
        begin_at: "1135-6-10",
        end_at:   "1141-8-13",
      },
      %{
        name:    "永治",
        yomi:    "えいじ",
        begin_at: "1141-8-13",
        end_at:   "1142-5-25",
      },
      %{
        name:    "康治",
        yomi:    "こうじ",
        begin_at: "1142-5-25",
        end_at:   "1144-3-28",
      },
      %{
        name:    "天養",
        yomi:    "てんよう",
        begin_at: "1144-3-28",
        end_at:   "1145-8-12",
      },
      %{
        name:    "久安",
        yomi:    "きゅうあん",
        begin_at: "1145-8-12",
        end_at:   "1151-2-14",
      },
      %{
        name:    "仁平",
        yomi:    "にんぺい",
        begin_at: "1151-2-14",
        end_at:   "1154-12-4",
      },
      %{
        name:    "久寿",
        yomi:    "きゅうじゅ",
        begin_at: "1154-12-4",
        end_at:   "1156-5-18",
      },
      %{
        name:    "保元",
        yomi:    "ほうげん",
        begin_at: "1156-5-18",
        end_at:   "1159-5-9",
      },
      %{
        name:    "平治",
        yomi:    "へいじ",
        begin_at: "1159-5-9",
        end_at:   "1160-2-18",
      },
      %{
        name:    "永暦",
        yomi:    "えいりゃく",
        begin_at: "1160-2-18",
        end_at:   "1161-9-24",
      },
      %{
        name:    "応保",
        yomi:    "おうほう",
        begin_at: "1161-9-24",
        end_at:   "1163-5-4",
      },
      %{
        name:    "長寛",
        yomi:    "ちょうかん",
        begin_at: "1163-5-4",
        end_at:   "1165-7-14",
      },
      %{
        name:    "永万",
        yomi:    "えいまん",
        begin_at: "1165-7-14",
        end_at:   "1166-9-23",
      },
      %{
        name:    "仁安",
        yomi:    "にんあん",
        begin_at: "1166-9-23",
        end_at:   "1169-5-6",
      },
      %{
        name:    "嘉応",
        yomi:    "かおう",
        begin_at: "1169-5-6",
        end_at:   "1171-5-27",
      },
      %{
        name:    "承安",
        yomi:    "しょうあん",
        begin_at: "1171-5-27",
        end_at:   "1175-8-16",
      },
      %{
        name:    "安元",
        yomi:    "あんげん",
        begin_at: "1175-8-16",
        end_at:   "1177-8-29",
      },
      %{
        name:    "治承",
        yomi:    "じしょう",
        begin_at: "1177-8-29",
        end_at:   "1181-8-25",
      },
      %{
        name:    "養和",
        yomi:    "ようわ",
        begin_at: "1181-8-25",
        end_at:   "1182-6-29",
      },
      %{
        name:    "寿永",
        yomi:    "じゅえい",
        begin_at: "1182-6-29",
        end_at:   "1184-5-27",
      },
      %{
        name:    "元暦",
        yomi:    "げんりゃく",
        begin_at: "1184-5-27",
        end_at:   "1185-9-9",
      },
      %{
        name:    "建久",
        yomi:    "けんきゅう",
        begin_at: "1190-5-16",
        end_at:   "1199-5-23",
      },
      %{
        name:    "正治",
        yomi:    "しょうじ",
        begin_at: "1199-5-23",
        end_at:   "1201-3-19",
      },
      %{
        name:    "建仁",
        yomi:    "けんにん",
        begin_at: "1201-3-19",
        end_at:   "1204-3-23",
      },
      %{
        name:    "元久",
        yomi:    "げんきゅう",
        begin_at: "1204-3-23",
        end_at:   "1206-6-5",
      },
      %{
        name:    "建永",
        yomi:    "けんえい",
        begin_at: "1206-6-5",
        end_at:   "1207-11-16",
      },
      %{
        name:    "承元",
        yomi:    "じょうげん",
        begin_at: "1207-11-16",
        end_at:   "1211-4-23",
      },
      %{
        name:    "建暦",
        yomi:    "けんりゃく",
        begin_at: "1211-4-23",
        end_at:   "1214-1-18",
      },
      %{
        name:    "建保",
        yomi:    "けんぽう",
        begin_at: "1214-1-18",
        end_at:   "1219-5-27",
      },
      %{
        name:    "承久",
        yomi:    "じょうきゅう",
        begin_at: "1219-5-27",
        end_at:   "1222-5-25",
      },
      %{
        name:    "貞応",
        yomi:    "じょうおう",
        begin_at: "1222-5-25",
        end_at:   "1224-12-31",
      },
      %{
        name:    "元仁",
        yomi:    "げんにん",
        begin_at: "1224-12-31",
        end_at:   "1225-5-28",
      },
      %{
        name:    "嘉禄",
        yomi:    "かろく",
        begin_at: "1225-5-28",
        end_at:   "1228-1-18",
      },
      %{
        name:    "安貞",
        yomi:    "あんてい",
        begin_at: "1228-1-18",
        end_at:   "1229-3-31",
      },
      %{
        name:    "寛喜",
        yomi:    "かんき",
        begin_at: "1229-3-31",
        end_at:   "1232-4-23",
      },
      %{
        name:    "貞永",
        yomi:    "じょうえい",
        begin_at: "1232-4-23",
        end_at:   "1233-5-25",
      },
      %{
        name:    "天福",
        yomi:    "てんぷく",
        begin_at: "1233-5-25",
        end_at:   "1234-11-27",
      },
      %{
        name:    "文暦",
        yomi:    "ぶんりゃく",
        begin_at: "1234-11-27",
        end_at:   "1235-11-1",
      },
      %{
        name:    "嘉禎",
        yomi:    "かてい",
        begin_at: "1235-11-1",
        end_at:   "1238-12-30",
      },
      %{
        name:    "暦仁",
        yomi:    "りゃくにん",
        begin_at: "1238-12-30",
        end_at:   "1239-3-13",
      },
      %{
        name:    "延応",
        yomi:    "えんおう",
        begin_at: "1239-3-13",
        end_at:   "1240-8-5",
      },
      %{
        name:    "仁治",
        yomi:    "にんじ",
        begin_at: "1240-8-5",
        end_at:   "1243-3-18",
      },
      %{
        name:    "寛元",
        yomi:    "かんげん",
        begin_at: "1243-3-18",
        end_at:   "1247-4-5",
      },
      %{
        name:    "宝治",
        yomi:    "ほうじ",
        begin_at: "1247-4-5",
        end_at:   "1249-5-2",
      },
      %{
        name:    "建長",
        yomi:    "けんちょう",
        begin_at: "1249-5-2",
        end_at:   "1256-10-24",
      },
      %{
        name:    "康元",
        yomi:    "こうげん",
        begin_at: "1256-10-24",
        end_at:   "1257-3-31",
      },
      %{
        name:    "正嘉",
        yomi:    "しょうか",
        begin_at: "1257-3-31",
        end_at:   "1259-4-20",
      },
      %{
        name:    "正元",
        yomi:    "しょうげん",
        begin_at: "1259-4-20",
        end_at:   "1260-5-24",
      },
      %{
        name:    "文応",
        yomi:    "ぶんおう",
        begin_at: "1260-5-24",
        end_at:   "1261-3-22",
      },
      %{
        name:    "弘長",
        yomi:    "こうちょう",
        begin_at: "1261-3-22",
        end_at:   "1264-3-27",
      },
      %{
        name:    "文永",
        yomi:    "ぶんえい",
        begin_at: "1264-3-27",
        end_at:   "1275-5-22",
      },
      %{
        name:    "建治",
        yomi:    "けんじ",
        begin_at: "1275-5-22",
        end_at:   "1278-3-23",
      },
      %{
        name:    "弘安",
        yomi:    "こうあん",
        begin_at: "1278-3-23",
        end_at:   "1288-5-29",
      },
      %{
        name:    "正応",
        yomi:    "しょうおう",
        begin_at: "1288-5-29",
        end_at:   "1293-9-6",
      },
      %{
        name:    "永仁",
        yomi:    "えいにん",
        begin_at: "1293-9-6",
        end_at:   "1299-5-25",
      },
      %{
        name:    "正安",
        yomi:    "しょうあん",
        begin_at: "1299-5-25",
        end_at:   "1302-12-10",
      },
      %{
        name:    "乾元",
        yomi:    "けんげん",
        begin_at: "1302-12-10",
        end_at:   "1303-9-16",
      },
      %{
        name:    "嘉元",
        yomi:    "かげん",
        begin_at: "1303-9-16",
        end_at:   "1307-1-18",
      },
      %{
        name:    "徳治",
        yomi:    "とくじ",
        begin_at: "1307-1-18",
        end_at:   "1308-11-22",
      },
      %{
        name:    "延慶",
        yomi:    "えんきょう",
        begin_at: "1308-11-22",
        end_at:   "1311-5-17",
      },
      %{
        name:    "応長",
        yomi:    "おうちょう",
        begin_at: "1311-5-17",
        end_at:   "1312-4-27",
      },
      %{
        name:    "正和",
        yomi:    "しょうわ",
        begin_at: "1312-4-27",
        end_at:   "1317-3-16",
      },
      %{
        name:    "文保",
        yomi:    "ぶんぽう",
        begin_at: "1317-3-16",
        end_at:   "1319-5-18",
      },
      %{
        name:    "元応",
        yomi:    "げんおう",
        begin_at: "1319-5-18",
        end_at:   "1321-3-22",
      },
      %{
        name:    "元亨",
        yomi:    "げんこう",
        begin_at: "1321-3-22",
        end_at:   "1324-12-25",
      },
      %{
        name:    "正中",
        yomi:    "しょうちゅう",
        begin_at: "1324-12-25",
        end_at:   "1326-5-28",
      },
      %{
        name:    "嘉暦",
        yomi:    "かりゃく",
        begin_at: "1326-5-28",
        end_at:   "1329-9-22",
      },
      %{
        name:    "元徳",
        yomi:    "げんとく",
        begin_at: "1329-9-22",
        end_at:   "1332-5-23",
      },
      %{
        name:    "興国",
        yomi:    "こうこく",
        begin_at: "1340-5-25",
        end_at:   "1347-1-20",
      },
      %{
        name:    "正平",
        yomi:    "しょうへい",
        begin_at: "1347-1-20",
        end_at:   "1370-8-16",
      },
      %{
        name:    "建徳",
        yomi:    "けんとく",
        begin_at: "1370-8-16",
        end_at:   "1372-5-1",
      },
      %{
        name:    "文中",
        yomi:    "ぶんちゅう",
        begin_at: "1372-5-1",
        end_at:   "1375-6-26",
      },
      %{
        name:    "天授",
        yomi:    "てんじゅ",
        begin_at: "1375-6-26",
        end_at:   "1381-3-6",
      },
      %{
        name:    "弘和",
        yomi:    "こうわ",
        begin_at: "1381-3-6",
        end_at:   "1384-5-18",
      },
      %{
        name:    "元中",
        yomi:    "げんちゅう",
        begin_at: "1384-5-18",
        end_at:   "1392-11-19",
      },
      %{
        name:    "暦応",
        yomi:    "りゃくおう",
        begin_at: "1338-10-11",
        end_at:   "1342-6-1",
      },
      %{
        name:    "康永",
        yomi:    "こうえい",
        begin_at: "1342-6-1",
        end_at:   "1345-11-15",
      },
      %{
        name:    "貞和",
        yomi:    "じょうわ",
        begin_at: "1345-11-15",
        end_at:   "1350-4-4",
      },
      %{
        name:    "観応",
        yomi:    "かんのう",
        begin_at: "1350-4-4",
        end_at:   "1352-11-4",
      },
      %{
        name:    "文和",
        yomi:    "ぶんな",
        begin_at: "1352-11-4",
        end_at:   "1356-4-29",
      },
      %{
        name:    "延文",
        yomi:    "えんぶん",
        begin_at: "1356-4-29",
        end_at:   "1361-5-4",
      },
      %{
        name:    "康安",
        yomi:    "こうあん",
        begin_at: "1361-5-4",
        end_at:   "1362-10-11",
      },
      %{
        name:    "貞治",
        yomi:    "じょうじ",
        begin_at: "1362-10-11",
        end_at:   "1368-3-7",
      },
      %{
        name:    "応安",
        yomi:    "おうあん",
        begin_at: "1368-3-7",
        end_at:   "1375-3-29",
      },
      %{
        name:    "永和",
        yomi:    "えいわ",
        begin_at: "1375-3-29",
        end_at:   "1379-4-9",
      },
      %{
        name:    "康暦",
        yomi:    "こうりゃく",
        begin_at: "1379-4-9",
        end_at:   "1381-3-20",
      },
      %{
        name:    "永徳",
        yomi:    "えいとく",
        begin_at: "1381-3-20",
        end_at:   "1384-3-19",
      },
      %{
        name:    "至徳",
        yomi:    "しとく",
        begin_at: "1384-3-19",
        end_at:   "1387-10-5",
      },
      %{
        name:    "嘉慶",
        yomi:    "かきょう",
        begin_at: "1387-10-5",
        end_at:   "1389-3-7",
      },
      %{
        name:    "康応",
        yomi:    "こうおう",
        begin_at: "1389-3-7",
        end_at:   "1390-4-12",
      },
      %{
        name:    "明徳",
        yomi:    "めいとく",
        begin_at: "1390-4-12",
        end_at:   "1394-8-2",
      },
      %{
        name:    "正長",
        yomi:    "しょうちょう",
        begin_at: "1428-6-10",
        end_at:   "1429-10-3",
      },
      %{
        name:    "永享",
        yomi:    "えいきょう",
        begin_at: "1429-10-3",
        end_at:   "1441-3-10",
      },
      %{
        name:    "嘉吉",
        yomi:    "かきつ",
        begin_at: "1441-3-10",
        end_at:   "1444-2-23",
      },
      %{
        name:    "文安",
        yomi:    "ぶんあん",
        begin_at: "1444-2-23",
        end_at:   "1449-8-16",
      },
      %{
        name:    "宝徳",
        yomi:    "ほうとく",
        begin_at: "1449-8-16",
        end_at:   "1452-8-10",
      },
      %{
        name:    "享徳",
        yomi:    "きょうとく",
        begin_at: "1452-8-10",
        end_at:   "1455-9-6",
      },
      %{
        name:    "康正",
        yomi:    "こうしょう",
        begin_at: "1455-9-6",
        end_at:   "1457-10-16",
      },
      %{
        name:    "長禄",
        yomi:    "ちょうろく",
        begin_at: "1457-10-16",
        end_at:   "1461-2-1",
      },
      %{
        name:    "寛正",
        yomi:    "かんしょう",
        begin_at: "1461-2-1",
        end_at:   "1466-3-14",
      },
      %{
        name:    "文正",
        yomi:    "ぶんしょう",
        begin_at: "1466-3-14",
        end_at:   "1467-4-9",
      },
      %{
        name:    "文明",
        yomi:    "ぶんめい",
        begin_at: "1469-6-8",
        end_at:   "1487-8-9",
      },
      %{
        name:    "長享",
        yomi:    "ちょうきょう",
        begin_at: "1487-8-9",
        end_at:   "1489-9-16",
      },
      %{
        name:    "延徳",
        yomi:    "えんとく",
        begin_at: "1489-9-16",
        end_at:   "1492-8-12",
      },
      %{
        name:    "明応",
        yomi:    "めいおう",
        begin_at: "1492-8-12",
        end_at:   "1501-3-18",
      },
      %{
        name:    "文亀",
        yomi:    "ぶんき",
        begin_at: "1501-3-18",
        end_at:   "1504-3-16",
      },
      %{
        name:    "永正",
        yomi:    "えいしょう",
        begin_at: "1504-3-16",
        end_at:   "1521-9-23",
      },
      %{
        name:    "大永",
        yomi:    "だいえい",
        begin_at: "1521-9-23",
        end_at:   "1528-9-3",
      },
      %{
        name:    "享禄",
        yomi:    "きょうろく",
        begin_at: "1528-9-3",
        end_at:   "1532-8-29",
      },
      %{
        name:    "天文",
        yomi:    "てんぶん",
        begin_at: "1532-8-29",
        end_at:   "1555-11-7",
      },
      %{
        name:    "弘治",
        yomi:    "こうじ",
        begin_at: "1555-11-7",
        end_at:   "1558-3-18",
      },
      %{
        name:    "永禄",
        yomi:    "えいろく",
        begin_at: "1558-3-18",
        end_at:   "1570-5-27",
      },
      %{
        name:    "元亀",
        yomi:    "げんき",
        begin_at: "1570-5-27",
        end_at:   "1573-8-25",
      },
      %{
        name:    "文禄",
        yomi:    "ぶんろく",
        begin_at: "1593-1-10",
        end_at:   "1596-12-16",
      },
      %{
        name:    "慶長",
        yomi:    "けいちょう",
        begin_at: "1596-12-16",
        end_at:   "1615-9-5",
      },
      %{
        name:    "寛永",
        yomi:    "かんえい",
        begin_at: "1624-4-17",
        end_at:   "1645-1-13",
      },
      %{
        name:    "正保",
        yomi:    "しょうほう",
        begin_at: "1645-1-13",
        end_at:   "1648-4-7",
      },
      %{
        name:    "慶安",
        yomi:    "けいあん",
        begin_at: "1648-4-7",
        end_at:   "1652-10-20",
      },
      %{
        name:    "承応",
        yomi:    "じょうおう",
        begin_at: "1652-10-20",
        end_at:   "1655-5-18",
      },
      %{
        name:    "明暦",
        yomi:    "めいれき",
        begin_at: "1655-5-18",
        end_at:   "1658-8-21",
      },
      %{
        name:    "万治",
        yomi:    "まんじ",
        begin_at: "1658-8-21",
        end_at:   "1661-5-23",
      },
      %{
        name:    "寛文",
        yomi:    "かんぶん",
        begin_at: "1661-5-23",
        end_at:   "1673-10-30",
      },
      %{
        name:    "延宝",
        yomi:    "えんぽう",
        begin_at: "1673-10-30",
        end_at:   "1681-11-9",
      },
      %{
        name:    "天和",
        yomi:    "てんな",
        begin_at: "1681-11-9",
        end_at:   "1684-4-5",
      },
      %{
        name:    "貞享",
        yomi:    "じょうきょう",
        begin_at: "1684-4-5",
        end_at:   "1688-10-23",
      },
      %{
        name:    "元禄",
        yomi:    "げんろく",
        begin_at: "1688-10-23",
        end_at:   "1704-4-16",
      },
      %{
        name:    "宝永",
        yomi:    "ほうえい",
        begin_at: "1704-4-16",
        end_at:   "1711-6-11",
      },
      %{
        name:    "正徳",
        yomi:    "しょうとく",
        begin_at: "1711-6-11",
        end_at:   "1716-8-9",
      },
      %{
        name:    "享保",
        yomi:    "きょうほう",
        begin_at: "1716-8-9",
        end_at:   "1736-6-7",
      },
      %{
        name:    "元文",
        yomi:    "げんぶん",
        begin_at: "1736-6-7",
        end_at:   "1741-4-12",
      },
      %{
        name:    "寛保",
        yomi:    "かんぽう",
        begin_at: "1741-4-12",
        end_at:   "1744-4-3",
      },
      %{
        name:    "延享",
        yomi:    "えんきょう",
        begin_at: "1744-4-3",
        end_at:   "1748-8-5",
      },
      %{
        name:    "寛延",
        yomi:    "かんえん",
        begin_at: "1748-8-5",
        end_at:   "1751-12-14",
      },
      %{
        name:    "宝暦",
        yomi:    "ほうれき",
        begin_at: "1751-12-14",
        end_at:   "1764-6-30",
      },
      %{
        name:    "明和",
        yomi:    "めいわ",
        begin_at: "1764-6-30",
        end_at:   "1772-12-10",
      },
      %{
        name:    "安永",
        yomi:    "あんえい",
        begin_at: "1772-12-10",
        end_at:   "1781-4-25",
      },
      %{
        name:    "天明",
        yomi:    "てんめい",
        begin_at: "1781-4-25",
        end_at:   "1789-2-19",
      },
      %{
        name:    "寛政",
        yomi:    "かんせい",
        begin_at: "1789-2-19",
        end_at:   "1801-3-19",
      },
      %{
        name:    "享和",
        yomi:    "きょうわ",
        begin_at: "1801-3-19",
        end_at:   "1804-3-22",
      },
      %{
        name:    "文化",
        yomi:    "ぶんか",
        begin_at: "1804-3-22",
        end_at:   "1818-5-26",
      },
      %{
        name:    "文政",
        yomi:    "ぶんせい",
        begin_at: "1818-5-26",
        end_at:   "1831-1-23",
      },
      %{
        name:    "天保",
        yomi:    "てんぽう",
        begin_at: "1831-1-23",
        end_at:   "1845-1-9",
      },
      %{
        name:    "弘化",
        yomi:    "こうか",
        begin_at: "1845-1-9",
        end_at:   "1848-4-1",
      },
      %{
        name:    "嘉永",
        yomi:    "かえい",
        begin_at: "1848-4-1",
        end_at:   "1855-1-15",
      },
      %{
        name:    "安政",
        yomi:    "あんせい",
        begin_at: "1855-1-15",
        end_at:   "1860-4-8",
      },
      %{
        name:    "万延",
        yomi:    "まんえん",
        begin_at: "1860-4-8",
        end_at:   "1861-3-29",
      },
      %{
        name:    "文久",
        yomi:    "ぶんきゅう",
        begin_at: "1861-3-29",
        end_at:   "1864-3-27",
      },
      %{
        name:    "元治",
        yomi:    "げんじ",
        begin_at: "1864-3-27",
        end_at:   "1865-5-1",
      },
      %{
        name:    "慶応",
        yomi:    "けいおう",
        begin_at: "1865-5-1",
        end_at:   "1868-10-23",
      },
      %{
        name:    "明治",
        yomi:    "めいじ",
        begin_at: "1868-1-25",
        end_at:   "1912-7-29",
      },
      %{
        name:    "大正",
        yomi:    "たいしょう",
        begin_at: "1912-7-30",
        end_at:   "1926-12-24",
      },
      %{
        name:    "昭和",
        yomi:    "しょうわ",
        begin_at: "1926-12-25",
        end_at:   "1989-1-7",
      },
      %{
        name:    "平成",
        yomi:    "へいせい",
        begin_at: "1989-1-8",
        end_at:   "2019-4-30",
      },
      %{
        name:    "令和",
        yomi:    "れいわ",
        begin_at: "2019-5-1",
        end_at:   "",
      },
    ]
  end
end