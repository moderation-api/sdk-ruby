# typed: strong

module ModerationAPI
  module Models
    module Wordlist
      class WordAddParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Wordlist::WordAddParams,
              ModerationAPI::Internal::AnyHash
            )
          end

        # ID of the wordlist to add words to
        sig { returns(String) }
        attr_accessor :id

        # Array of words to add to the wordlist. Duplicate words will be ignored.
        sig { returns(T::Array[String]) }
        attr_accessor :words

        sig do
          params(
            id: String,
            words: T::Array[String],
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the wordlist to add words to
          id:,
          # Array of words to add to the wordlist. Duplicate words will be ignored.
          words:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              words: T::Array[String],
              request_options: ModerationAPI::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
