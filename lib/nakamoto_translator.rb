# frozen_string_literal: false

require_relative "nakamoto_translator/version"

module NakamotoTranslator
  extend self

  CHARMAP = {
    # Single letters
    "A" => "ト", "B" => "ろ", "C" => "く", "D" => "わ", "E" => "モ", "F" => "キ",
    "G" => nil, "H" => "サ", "I" => "エ", "J" => nil, "K" => "ケ", "L" => "し", "M" => nil,
    "N" => "カ", "O" => "ロ", "P" => "や", "Q" => nil, "R" => "マ", "S" => "ら", "T" => "イ",
    "U" => nil, "V" => "レ", "W" => nil, "X" => nil, "Y" => "と", "Z" => nil,

    # Combos
    "LI" => "い", "FI" => "な", "IT" => "は", "IL" => "ル", "IJ" => "リ"
  }.freeze

  HIRAGANA_KATAKANA = {
    # Hiragana
    "あ" => "a", "い" => "i", "う" => "u", "え" => "e", "お" => "o",
    "か" => "ka", "き" => "ki", "く" => "ku", "け" => "ke", "こ" => "ko",
    "さ" => "sa", "し" => "shi", "す" => "su", "せ" => "se", "そ" => "so",
    "た" => "ta", "ち" => "chi", "つ" => "tsu", "て" => "te", "と" => "to",
    "な" => "na", "に" => "ni", "ぬ" => "nu", "ね" => "ne", "の" => "no",
    "は" => "ha", "ひ" => "hi", "ふ" => "fu", "へ" => "he", "ほ" => "ho",
    "ま" => "ma", "み" => "mi", "む" => "mu", "め" => "me", "も" => "mo",
    "や" => "ya", "ゆ" => "yu", "よ" => "yo",
    "ら" => "ra", "り" => "ri", "る" => "ru", "れ" => "re", "ろ" => "ro",
    "わ" => "wa", "を" => "wo",
    "ん" => "n",
    "が" => "ga", "ぎ" => "gi", "ぐ" => "gu", "げ" => "ge", "ご" => "go",
    "ざ" => "za", "じ" => "ji", "ず" => "zu", "ぜ" => "ze", "ぞ" => "zo",
    "だ" => "da", "ぢ" => "ji", "づ" => "zu", "で" => "de", "ど" => "do",
    "ば" => "ba", "び" => "bi", "ぶ" => "bu", "べ" => "be", "ぼ" => "bo",
    "ぱ" => "pa", "ぴ" => "pi", "ぷ" => "pu", "ぺ" => "pe", "ぽ" => "po",

    # Katakana
    "ア" => "a", "イ" => "i", "ウ" => "u", "エ" => "e", "オ" => "o",
    "カ" => "ka", "キ" => "ki", "ク" => "ku", "ケ" => "ke", "コ" => "ko",
    "サ" => "sa", "シ" => "shi", "ス" => "su", "セ" => "se", "ソ" => "so",
    "タ" => "ta", "チ" => "chi", "ツ" => "tsu", "テ" => "te", "ト" => "to",
    "ナ" => "na", "ニ" => "ni", "ヌ" => "nu", "ネ" => "ne", "ノ" => "no",
    "ハ" => "ha", "ヒ" => "hi", "フ" => "fu", "ヘ" => "he", "ホ" => "ho",
    "マ" => "ma", "ミ" => "mi", "ム" => "mu", "メ" => "me", "モ" => "mo",
    "ヤ" => "ya", "ユ" => "yu", "ヨ" => "yo",
    "ラ" => "ra", "リ" => "ri", "ル" => "ru", "レ" => "re", "ロ" => "ro",
    "ワ" => "wa", "ヲ" => "wo",
    "ン" => "n",
    "ガ" => "ga", "ギ" => "gi", "グ" => "gu", "ゲ" => "ge", "ゴ" => "go",
    "ザ" => "za", "ジ" => "ji", "ズ" => "zu", "ゼ" => "ze", "ゾ" => "zo",
    "ダ" => "da", "ヂ" => "ji", "ヅ" => "zu", "デ" => "de", "ド" => "do",
    "バ" => "ba", "ビ" => "bi", "ブ" => "bu", "ベ" => "be", "ボ" => "bo",
    "パ" => "pa", "ピ" => "pi", "プ" => "pu", "ペ" => "pe", "ポ" => "po"
  }.freeze

  def from_latin_to_nakamoto(original_string)
    string = original_string.upcase
    CHARMAP.keys.sort_by { |key| -key.length }.each do |key|
      string.gsub!(key, CHARMAP[key]) if CHARMAP[key]
    end
    string
  end

  def from_nakamoto_to_latin(original_string)
    string = original_string.dup
    CHARMAP.values.compact.sort_by { |value| -value.length }.each do |value|
      string.gsub!(value, CHARMAP.key(value))
    end
    string.downcase
  end

  def from_nakamoto_to_japanese(nakamoto_string)
    string = nakamoto_string.dup
    HIRAGANA_KATAKANA.each do |character, latin|
      string.gsub!(character, latin)
    end
    string
  end
end
