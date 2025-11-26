# typed: strong

module ModerationAPI
  module Models
    module Wordlist
      class WordAddResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Wordlist::WordAddResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Number of words added
        sig { returns(Float) }
        attr_accessor :added_count

        # List of words that were added
        sig { returns(T::Array[String]) }
        attr_accessor :added_words

        # Total number of words in wordlist
        sig { returns(Float) }
        attr_accessor :total_count

        sig do
          params(
            added_count: Float,
            added_words: T::Array[String],
            total_count: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of words added
          added_count:,
          # List of words that were added
          added_words:,
          # Total number of words in wordlist
          total_count:
        )
        end

        sig do
          override.returns(
            {
              added_count: Float,
              added_words: T::Array[String],
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
