# frozen_string_literal: true

RSpec.describe NakamotoTranslator do
  it "encodes from latin to nakamoto (Hal Finey → サトし なカモと)" do
    expect(NakamotoTranslator.from_latin_to_nakamoto("hal finey")).to eq("サトし なカモと")
  end

  it "encodes from nakamoto to latin (サトし なカモと → hal finey)" do
    expect(NakamotoTranslator.from_nakamoto_to_latin("サトし なカモと")).to eq("hal finey")
  end
end
