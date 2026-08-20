# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Webhooks#delete
    class WebhookDeleteResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the webhook.
      #
      #   @return [String]
      required :id, String

      # @!attribute deleted
      #   Whether the webhook was deleted.
      #
      #   @return [Boolean]
      required :deleted, ModerationAPI::Internal::Type::Boolean

      # @!method initialize(id:, deleted:)
      #   @param id [String] The ID of the webhook.
      #
      #   @param deleted [Boolean] Whether the webhook was deleted.
    end
  end
end
