# typed: strong

module ModerationAPI
  module Models
    class WordlistRetrieveParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::WordlistRetrieveParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # ID of the wordlist to get
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the wordlist to get
        id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { id: String, request_options: ModerationAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
