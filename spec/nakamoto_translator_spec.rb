# frozen_string_literal: true

RSpec.describe NakamotoTranslator do
  it "has a version number" do
    expect(NakamotoTranslator::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(NakamotoTranslator.encode("hal finey")).to eq("satoshi nakamoto")
  end
end
