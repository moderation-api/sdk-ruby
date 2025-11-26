# typed: strong

module ModerationAPI
  module Models
    class WordlistUpdateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::WordlistUpdateParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # New description for the wordlist
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # New key for the wordlist
      sig { returns(T.nilable(String)) }
      attr_reader :key

      sig { params(key: String).void }
      attr_writer :key

      # New name for the wordlist
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Deprecated. Now using threshold in project settings.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strict

      sig { params(strict: T::Boolean).void }
      attr_writer :strict

      # New words for the wordlist. Replace the existing words with these new ones.
      # Duplicate words will be ignored.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :words

      sig { params(words: T::Array[String]).void }
      attr_writer :words

      sig do
        params(
          description: String,
          key: String,
          name: String,
          strict: T::Boolean,
          words: T::Array[String],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # New description for the wordlist
        description: nil,
        # New key for the wordlist
        key: nil,
        # New name for the wordlist
        name: nil,
        # Deprecated. Now using threshold in project settings.
        strict: nil,
        # New words for the wordlist. Replace the existing words with these new ones.
        # Duplicate words will be ignored.
        words: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: String,
            key: String,
            name: String,
            strict: T::Boolean,
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
