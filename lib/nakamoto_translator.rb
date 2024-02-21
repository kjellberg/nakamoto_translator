# frozen_string_literal: false

require_relative "nakamoto_translator/version"

module NakamotoTranslator
  module_function

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
    # Single letters
    "ト" => "to",
    "ろ" => "ro",
    "く" => "ku",
    "わ" => "wa",
    "モ" => "mo",
    "キ" => "ki",
    "サ" => "sa",
    "エ" => "e",
    "ケ" => "ke",
    "し" => "shi",
    "カ" => "ka",
    "ロ" => "ro",
    "や" => "ya",
    "マ" => "ma",
    "ら" => "ra",
    "イ" => "i",
    "レ" => "re",
    "と" => "to",

    # Combos
    "い" => "i",
    "な" => "na",
    "は" => "ha",
    "ル" => "ru",
    "リ" => "ri"
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

  def from_japanese_to_nakamoto(japanese_string)
    string = japanese_string.dup
    HIRAGANA_KATAKANA.each do |character, latin|
      string.gsub!(latin, character)
    end
    string
  end
end
