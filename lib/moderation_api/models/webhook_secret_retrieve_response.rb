# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::WebhookSecret#retrieve
    class WebhookSecretRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute secret
      #   The signing secret for this project. Every webhook delivery is signed with
      #   HMAC-SHA256 over the raw JSON body, hex-encoded in the `modapi-signature`
      #   header.
      #
      #   @return [String]
      required :secret, String

      # @!method initialize(secret:)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::WebhookSecretRetrieveResponse} for more details.
      #
      #   @param secret [String] The signing secret for this project. Every webhook delivery is signed with HMAC-
    end
  end
end
