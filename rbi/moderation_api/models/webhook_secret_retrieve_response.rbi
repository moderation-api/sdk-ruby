# typed: strong

module ModerationAPI
  module Models
    class WebhookSecretRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::WebhookSecretRetrieveResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The signing secret for this project. Every webhook delivery is signed with
      # HMAC-SHA256 over the raw JSON body, hex-encoded in the `modapi-signature`
      # header.
      sig { returns(String) }
      attr_accessor :secret

      sig { params(secret: String).returns(T.attached_class) }
      def self.new(
        # The signing secret for this project. Every webhook delivery is signed with
        # HMAC-SHA256 over the raw JSON body, hex-encoded in the `modapi-signature`
        # header.
        secret:
      )
      end

      sig { override.returns({ secret: String }) }
      def to_hash
      end
    end
  end
end
