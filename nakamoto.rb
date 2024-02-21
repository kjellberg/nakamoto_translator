
class NakamotoTranslator
  def initialize
    @alphabet = {
      "A" => "ト",
      "B" => "ろ",
      "C" => "く",
      "D" => "わ",
      "E" => "モ",
      "F" => "キ",
      "G" => nil,
      "H" => "サ",
      "I" => "エ",
      "J" => nil,
      "K" => "ケ",
      "L" => "し",
      "M" => nil,
      "N" => "カ",
      "O" => "ロ",
      "P" => "や",
      "Q" => nil,
      "R" => "マ",
      "S" => "ら",
      "T" => "イ",
      "U" => nil,
      "V" => "レ",
      "W" => nil,
      "X" => nil,
      "Y" => "と",
      "Z" => nil
    }

    @combos = {
      "LI" => "い",
      "FI" => "な",
      "IT" => "は",
      "IL" => "ル",
      "IJ" => "リ",
    }

    @hiragana = {
      "あ" => "a", "い" => "i", "う" => "u", "え" => "e", "お" => "o",
      "か" => "ka", "き" => "ki", "く" => "ku", "け" => "ke", "こ" => "ko",
      "さ" => "sa", "し" => "shi", "す" => "su", "せ" => "se", "そ" => "so",
      "た" => "ta", "ち" => "chi", "つ" => "tsu", "て" => "te", "と" => "to",
      "な" => "na", "に" => "ni", "ぬ" => "nu", "ね" => "ne", "の" => "no",
      "は" => "ha", "ひ" => "hi", "ふ" => "fu", "へ" => "he", "ほ" => "ho",
      "ま" => "ma", "み" => "mi", "む" => "mu", "め" => "me", "も" => "mo",
      "や" => "ya",               "ゆ" => "yu",               "よ" => "yo",
      "ら" => "ra", "り" => "ri", "る" => "ru", "れ" => "re", "ろ" => "ro",
      "わ" => "wa",                                           "を" => "wo",
      "ん" => "n",
      "が" => "ga", "ぎ" => "gi", "ぐ" => "gu", "げ" => "ge", "ご" => "go",
      "ざ" => "za", "じ" => "ji", "ず" => "zu", "ぜ" => "ze", "ぞ" => "zo",
      "だ" => "da", "ぢ" => "ji", "づ" => "zu", "で" => "de", "ど" => "do",
      "ば" => "ba", "び" => "bi", "ぶ" => "bu", "べ" => "be", "ぼ" => "bo",
      "ぱ" => "pa", "ぴ" => "pi", "ぷ" => "pu", "ぺ" => "pe", "ぽ" => "po"
    }

    @katakana =  {
      "ア" => "a", "イ" => "i", "ウ" => "u", "エ" => "e", "オ" => "o",
      "カ" => "ka", "キ" => "ki", "ク" => "ku", "ケ" => "ke", "コ" => "ko",
      "サ" => "sa", "シ" => "shi", "ス" => "su", "セ" => "se", "ソ" => "so",
      "タ" => "ta", "チ" => "chi", "ツ" => "tsu", "テ" => "te", "ト" => "to",
      "ナ" => "na", "ニ" => "ni", "ヌ" => "nu", "ネ" => "ne", "ノ" => "no",
      "ハ" => "ha", "ヒ" => "hi", "フ" => "fu", "ヘ" => "he", "ホ" => "ho",
      "マ" => "ma", "ミ" => "mi", "ム" => "mu", "メ" => "me", "モ" => "mo",
      "ヤ" => "ya",               "ユ" => "yu",               "ヨ" => "yo",
      "ラ" => "ra", "リ" => "ri", "ル" => "ru", "レ" => "re", "ロ" => "ro",
      "ワ" => "wa",                                           "ヲ" => "wo",
      "ン" => "n",
      "ガ" => "ga", "ギ" => "gi", "グ" => "gu", "ゲ" => "ge", "ゴ" => "go",
      "ザ" => "za", "ジ" => "ji", "ズ" => "zu", "ゼ" => "ze", "ゾ" => "zo",
      "ダ" => "da", "ヂ" => "ji", "ヅ" => "zu", "デ" => "de", "ド" => "do",
      "バ" => "ba", "ビ" => "bi", "ブ" => "bu", "ベ" => "be", "ボ" => "bo",
      "パ" => "pa", "ピ" => "pi", "プ" => "pu", "ペ" => "pe", "ポ" => "po"
    }

    @charmap = @hiragana.merge(@katakana)
  end

  def translate(string)
    string.upcase!

    @combos.each do |combo, char|
      string.gsub!(combo, char)
    end

    japanese = string.gsub(/./) { |char| @alphabet.has_key?(char) ? @alphabet[char] : char }
    japanese.gsub(/./) { |char| @charmap.has_key?(char) ? @charmap[char] : char }
  end
end

translator = NakamotoTranslator.new
puts translator.translate(ARGV[0].dup)
