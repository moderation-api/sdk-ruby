# typed: strong

module ModerationAPI
  module Models
    class WordlistListResponseItem < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::WordlistListResponseItem,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Unique identifier of the wordlist
      sig { returns(String) }
      attr_accessor :id

      # When the wordlist was created
      sig { returns(T.nilable(String)) }
      attr_accessor :created_at

      # Description of the wordlist
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the wordlist
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # User who created the wordlist
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          created_at: T.nilable(String),
          description: T.nilable(String),
          name: T.nilable(String),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier of the wordlist
        id:,
        # When the wordlist was created
        created_at:,
        # Description of the wordlist
        description:,
        # Name of the wordlist
        name:,
        # User who created the wordlist
        user_id:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: T.nilable(String),
            description: T.nilable(String),
            name: T.nilable(String),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end

    WordlistListResponse =
      T.let(
        ModerationAPI::Internal::Type::ArrayOf[
          ModerationAPI::Models::WordlistListResponseItem
        ],
        ModerationAPI::Internal::Type::Converter
      )
  end
end
