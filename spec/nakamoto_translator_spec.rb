# frozen_string_literal: true

RSpec.describe NakamotoTranslator do
  it "encodes from latin to nakamoto (Hal Finey → サトし なカモと)" do
    expect(NakamotoTranslator.from_latin_to_nakamoto("Hal Finey")).to eq("サトし なカモと")
  end
end
