# frozen_string_literal: true

module ModerationAPI
  module Models
    module Wordlist
      # @see ModerationAPI::Resources::Wordlist::Words#remove
      class WordRemoveParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute words
        #   Array of words to remove from the wordlist
        #
        #   @return [Array<String>]
        required :words, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!method initialize(words:, request_options: {})
        #   @param words [Array<String>] Array of words to remove from the wordlist
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
