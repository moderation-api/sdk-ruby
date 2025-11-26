# frozen_string_literal: true

module ModerationAPI
  module Models
    module Wordlist
      # @see ModerationAPI::Resources::Wordlist::Words#remove
      class WordRemoveResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute removed_count
        #   Number of words removed
        #
        #   @return [Float]
        required :removed_count, Float, api_name: :removedCount

        # @!attribute removed_words
        #   List of words removed
        #
        #   @return [Array<String>]
        required :removed_words, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :removedWords

        # @!attribute total_count
        #   Total number of words in wordlist
        #
        #   @return [Float]
        required :total_count, Float, api_name: :totalCount

        # @!method initialize(removed_count:, removed_words:, total_count:)
        #   @param removed_count [Float] Number of words removed
        #
        #   @param removed_words [Array<String>] List of words removed
        #
        #   @param total_count [Float] Total number of words in wordlist
      end
    end
  end
end
