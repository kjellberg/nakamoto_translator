# frozen_string_literal: true

RSpec.describe NakamotoTranslator do
  it "translates from latin to nakamoto (Hal Finey → サトし なカモと)" do
    expect(NakamotoTranslator.from_latin_to_nakamoto("hal finey")).to eq("サトし なカモと")
  end

  it "translates from nakamoto to latin (サトし なカモと → hal finey)" do
    expect(NakamotoTranslator.from_nakamoto_to_latin("サトし なカモと")).to eq("hal finey")
  end

  it "translates from nakamoto to japanese (サトし なカモと → satoshi nakamoto)" do
    expect(NakamotoTranslator.from_nakamoto_to_japanese("サトし なカモと")).to eq("satoshi nakamoto")
  end

  it "translates from japanese to nakamoto (satoshi nakamoto → サトし なカモと)" do
    expect(NakamotoTranslator.from_japanese_to_nakamoto("satoshi nakamoto")).to eq("サトし なカモと")
  end
end
