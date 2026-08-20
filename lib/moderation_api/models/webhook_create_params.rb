# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Webhooks#create
    class WebhookCreateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute event_types
      #   Event types this webhook subscribes to. One webhook URL receives all events you
      #   list here.
      #
      #   @return [Array<Symbol, ModerationAPI::Models::WebhookCreateParams::EventType>]
      required :event_types,
               -> {
                 ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::WebhookCreateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute name
      #   The webhook's name, used to identify it in the dashboard
      #
      #   @return [String]
      required :name, String

      # @!attribute url
      #   The webhook's URL. We'll call this URL when an event occurs.
      #
      #   @return [String]
      required :url, String

      # @!attribute description
      #   The webhook's description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!method initialize(event_types:, name:, url:, description: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::WebhookCreateParams} for more details.
      #
      #   @param event_types [Array<Symbol, ModerationAPI::Models::WebhookCreateParams::EventType>] Event types this webhook subscribes to. One webhook URL receives all events you
      #
      #   @param name [String] The webhook's name, used to identify it in the dashboard
      #
      #   @param url [String] The webhook's URL. We'll call this URL when an event occurs.
      #
      #   @param description [String, nil] The webhook's description
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
