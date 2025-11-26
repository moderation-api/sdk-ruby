# typed: strong

module ModerationAPI
  module Models
    module Wordlist
      class WordRemoveResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Wordlist::WordRemoveResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Number of words removed
        sig { returns(Float) }
        attr_accessor :removed_count

        # List of words removed
        sig { returns(T::Array[String]) }
        attr_accessor :removed_words

        # Total number of words in wordlist
        sig { returns(Float) }
        attr_accessor :total_count

        sig do
          params(
            removed_count: Float,
            removed_words: T::Array[String],
            total_count: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of words removed
          removed_count:,
          # List of words removed
          removed_words:,
          # Total number of words in wordlist
          total_count:
        )
        end

        sig do
          override.returns(
            {
              removed_count: Float,
              removed_words: T::Array[String],
              total_count: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
