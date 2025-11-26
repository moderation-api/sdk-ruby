# frozen_string_literal: true

module ModerationAPI
  module Models
    module Wordlist
      # @see ModerationAPI::Resources::Wordlist::Words#add
      class WordAddResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute added_count
        #   Number of words added
        #
        #   @return [Float]
        required :added_count, Float, api_name: :addedCount

        # @!attribute added_words
        #   List of words that were added
        #
        #   @return [Array<String>]
        required :added_words, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :addedWords

        # @!attribute total_count
        #   Total number of words in wordlist
        #
        #   @return [Float]
        required :total_count, Float, api_name: :totalCount

        # @!method initialize(added_count:, added_words:, total_count:)
        #   @param added_count [Float] Number of words added
        #
        #   @param added_words [Array<String>] List of words that were added
        #
        #   @param total_count [Float] Total number of words in wordlist
      end
    end
  end
end
