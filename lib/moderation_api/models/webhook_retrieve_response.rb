# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Webhooks#retrieve
    class WebhookRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the webhook.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The date the webhook was created.
      #
      #   @return [String]
      required :created_at, String, api_name: :createdAt

      # @!attribute event_types
      #   Event types this webhook subscribes to. Empty for legacy v1 webhooks, which
      #   subscribe via their single deprecated `type` instead.
      #
      #   @return [Array<Symbol, ModerationAPI::Models::WebhookRetrieveResponse::EventType>]
      required :event_types,
               -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::WebhookRetrieveResponse::EventType] },
               api_name: :eventTypes

      # @!attribute name
      #   The webhook's name.
      #
      #   @return [String]
      required :name, String

      # @!attribute payload_version
      #   Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
      #   shape and is read-only via this API.
      #
      #   @return [Symbol, ModerationAPI::Models::WebhookRetrieveResponse::PayloadVersion]
      required :payload_version,
               enum: -> { ModerationAPI::Models::WebhookRetrieveResponse::PayloadVersion },
               api_name: :payloadVersion

      # @!attribute url
      #   The URL we call when a subscribed event occurs.
      #
      #   @return [String]
      required :url, String

      # @!attribute description
      #   The webhook's description.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!method initialize(id:, created_at:, event_types:, name:, payload_version:, url:, description: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::WebhookRetrieveResponse} for more details.
      #
      #   @param id [String] The ID of the webhook.
      #
      #   @param created_at [String] The date the webhook was created.
      #
      #   @param event_types [Array<Symbol, ModerationAPI::Models::WebhookRetrieveResponse::EventType>] Event types this webhook subscribes to. Empty for legacy v1 webhooks, which subs
      #
      #   @param name [String] The webhook's name.
      #
      #   @param payload_version [Symbol, ModerationAPI::Models::WebhookRetrieveResponse::PayloadVersion] Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
      #
      #   @param url [String] The URL we call when a subscribed event occurs.
      #
      #   @param description [String, nil] The webhook's description.

      module EventType
        extend ModerationAPI::Internal::Type::Enum

        QUEUE_ITEM_NEW = :QUEUE_ITEM_NEW
        QUEUE_ITEM_COMPLETED = :QUEUE_ITEM_COMPLETED
        QUEUE_ITEM_ACTION = :QUEUE_ITEM_ACTION
        QUEUE_ITEM_REJECTED = :QUEUE_ITEM_REJECTED
        QUEUE_ITEM_ALLOWED = :QUEUE_ITEM_ALLOWED
        AUTHOR_BLOCKED = :AUTHOR_BLOCKED
        AUTHOR_UNBLOCKED = :AUTHOR_UNBLOCKED
        AUTHOR_SUSPENDED = :AUTHOR_SUSPENDED
        AUTHOR_UPDATED = :AUTHOR_UPDATED
        AUTHOR_TRUST_LEVEL_CHANGED = :AUTHOR_TRUST_LEVEL_CHANGED
        AUTHOR_ACTION = :AUTHOR_ACTION

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
      # shape and is read-only via this API.
      #
      # @see ModerationAPI::Models::WebhookRetrieveResponse#payload_version
      module PayloadVersion
        extend ModerationAPI::Internal::Type::Enum

        V1 = :V1
        V2 = :V2

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
