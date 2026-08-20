# typed: strong

module ModerationAPI
  module Resources
    class WebhookSecret
      # Get the signing secret used to sign webhook deliveries for this project,
      # creating one if none exists yet. Verify deliveries by comparing the
      # `modapi-signature` header to HMAC-SHA256(raw request body, secret) hex-encoded.
      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          ModerationAPI::Models::WebhookSecretRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
