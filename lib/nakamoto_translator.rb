# frozen_string_literal: true

require_relative "nakamoto_translator/version"

module NakamotoTranslator
  class Error < StandardError; end
  
  autoload :Encoder, "nakamoto_translator/encoder"

  def self.encode(string)
    Encoder.new(string).call
  end
end
