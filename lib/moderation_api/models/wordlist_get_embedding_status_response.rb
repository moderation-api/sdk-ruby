# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Wordlist#get_embedding_status
    class WordlistGetEmbeddingStatusResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute progress
      #   Percentage of words that have been embedded (0-100)
      #
      #   @return [Float]
      required :progress, Float

      # @!attribute remaining_words
      #   Number of words still waiting to be embedded
      #
      #   @return [Float]
      required :remaining_words, Float, api_name: :remainingWords

      # @!attribute total_words
      #   Total number of words in the wordlist
      #
      #   @return [Float]
      required :total_words, Float, api_name: :totalWords

      # @!method initialize(progress:, remaining_words:, total_words:)
      #   Embedding status details
      #
      #   @param progress [Float] Percentage of words that have been embedded (0-100)
      #
      #   @param remaining_words [Float] Number of words still waiting to be embedded
      #
      #   @param total_words [Float] Total number of words in the wordlist
    end
  end
end
