# frozen_string_literal: true

module ModerationAPI
  module Resources
    class WebhookSecret
      # Get the signing secret used to sign webhook deliveries for this project,
      # creating one if none exists yet. Verify deliveries by comparing the
      # `modapi-signature` header to HMAC-SHA256(raw request body, secret) hex-encoded.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WebhookSecretRetrieveResponse]
      #
      # @see ModerationAPI::Models::WebhookSecretRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "webhook-secret",
          model: ModerationAPI::Models::WebhookSecretRetrieveResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
