# typed: strong

module ModerationAPI
  module Models
    class WordlistUpdateResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::WordlistUpdateResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # ID of the wordlist
      sig { returns(String) }
      attr_accessor :id

      # Creation date of the wordlist
      sig { returns(String) }
      attr_accessor :created_at

      # Name of the wordlist
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # ID of the organization
      sig { returns(String) }
      attr_accessor :organization_id

      # Strict mode
      sig { returns(T::Boolean) }
      attr_accessor :strict

      # ID of the user
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # Words in the wordlist
      sig { returns(T::Array[String]) }
      attr_accessor :words

      sig do
        params(
          id: String,
          created_at: String,
          name: T.nilable(String),
          organization_id: String,
          strict: T::Boolean,
          user_id: T.nilable(String),
          words: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the wordlist
        id:,
        # Creation date of the wordlist
        created_at:,
        # Name of the wordlist
        name:,
        # ID of the organization
        organization_id:,
        # Strict mode
        strict:,
        # ID of the user
        user_id:,
        # Words in the wordlist
        words:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            name: T.nilable(String),
            organization_id: String,
            strict: T::Boolean,
            user_id: T.nilable(String),
            words: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
