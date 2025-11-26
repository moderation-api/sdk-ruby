# typed: strong

module ModerationAPI
  module Models
    class WordlistGetEmbeddingStatusResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::WordlistGetEmbeddingStatusResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Percentage of words that have been embedded (0-100)
      sig { returns(Float) }
      attr_accessor :progress

      # Number of words still waiting to be embedded
      sig { returns(Float) }
      attr_accessor :remaining_words

      # Total number of words in the wordlist
      sig { returns(Float) }
      attr_accessor :total_words

      # Embedding status details
      sig do
        params(
          progress: Float,
          remaining_words: Float,
          total_words: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Percentage of words that have been embedded (0-100)
        progress:,
        # Number of words still waiting to be embedded
        remaining_words:,
        # Total number of words in the wordlist
        total_words:
      )
      end

      sig do
        override.returns(
          { progress: Float, remaining_words: Float, total_words: Float }
        )
      end
      def to_hash
      end
    end
  end
end
