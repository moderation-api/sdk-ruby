# typed: strong

module ModerationAPI
  module Models
    class AuthorRetrieveParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::AuthorRetrieveParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Either external ID or the ID assigned by moderation API.
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Either external ID or the ID assigned by moderation API.
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
