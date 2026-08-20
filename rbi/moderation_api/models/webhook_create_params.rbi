# typed: strong

module ModerationAPI
  module Models
    class WebhookCreateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::WebhookCreateParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Event types this webhook subscribes to. One webhook URL receives all events you
      # list here.
      sig do
        returns(
          T::Array[ModerationAPI::WebhookCreateParams::EventType::OrSymbol]
        )
      end
      attr_accessor :event_types

      # The webhook's name, used to identify it in the dashboard
      sig { returns(String) }
      attr_accessor :name

      # The webhook's URL. We'll call this URL when an event occurs.
      sig { returns(String) }
      attr_accessor :url

      # The webhook's description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        params(
          event_types:
            T::Array[ModerationAPI::WebhookCreateParams::EventType::OrSymbol],
          name: String,
          url: String,
          description: T.nilable(String),
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Event types this webhook subscribes to. One webhook URL receives all events you
        # list here.
        event_types:,
        # The webhook's name, used to identify it in the dashboard
        name:,
        # The webhook's URL. We'll call this URL when an event occurs.
        url:,
        # The webhook's description
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types:
              T::Array[ModerationAPI::WebhookCreateParams::EventType::OrSymbol],
            name: String,
            url: String,
            description: T.nilable(String),
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module EventType
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::WebhookCreateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUE_ITEM_NEW =
          T.let(
            :QUEUE_ITEM_NEW,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_COMPLETED =
          T.let(
            :QUEUE_ITEM_COMPLETED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ACTION =
          T.let(
            :QUEUE_ITEM_ACTION,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_REJECTED =
          T.let(
            :QUEUE_ITEM_REJECTED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ALLOWED =
          T.let(
            :QUEUE_ITEM_ALLOWED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_BLOCKED =
          T.let(
            :AUTHOR_BLOCKED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_UNBLOCKED =
          T.let(
            :AUTHOR_UNBLOCKED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_SUSPENDED =
          T.let(
            :AUTHOR_SUSPENDED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_UPDATED =
          T.let(
            :AUTHOR_UPDATED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_TRUST_LEVEL_CHANGED =
          T.let(
            :AUTHOR_TRUST_LEVEL_CHANGED,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )
        AUTHOR_ACTION =
          T.let(
            :AUTHOR_ACTION,
            ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::WebhookCreateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
