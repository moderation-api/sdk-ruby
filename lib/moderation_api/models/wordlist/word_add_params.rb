# frozen_string_literal: true

module ModerationAPI
  module Models
    module Wordlist
      # @see ModerationAPI::Resources::Wordlist::Words#add
      class WordAddParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute words
        #   Array of words to add to the wordlist. Duplicate words will be ignored.
        #
        #   @return [Array<String>]
        required :words, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!method initialize(words:, request_options: {})
        #   @param words [Array<String>] Array of words to add to the wordlist. Duplicate words will be ignored.
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
