# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Webhooks#update
    class WebhookUpdateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the webhook to update.
      #
      #   @return [String]
      required :id, String

      # @!attribute description
      #   The webhook's description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute event_types
      #   Event types this webhook subscribes to. One webhook URL receives all events you
      #   list here.
      #
      #   @return [Array<Symbol, ModerationAPI::Models::WebhookUpdateParams::EventType>, nil]
      optional :event_types,
               -> {
                 ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::WebhookUpdateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute name
      #   The webhook's name, used to identify it in the dashboard
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute url
      #   The webhook's URL. We'll call this URL when an event occurs.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(id:, description: nil, event_types: nil, name: nil, url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::WebhookUpdateParams} for more details.
      #
      #   @param id [String] The ID of the webhook to update.
      #
      #   @param description [String, nil] The webhook's description
      #
      #   @param event_types [Array<Symbol, ModerationAPI::Models::WebhookUpdateParams::EventType>] Event types this webhook subscribes to. One webhook URL receives all events you
      #
      #   @param name [String] The webhook's name, used to identify it in the dashboard
      #
      #   @param url [String] The webhook's URL. We'll call this URL when an event occurs.
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

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
    end
  end
end
