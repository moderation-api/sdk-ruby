# typed: strong

module ModerationAPI
  module Models
    class WebhookUpdateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::WebhookUpdateParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The ID of the webhook to update.
      sig { returns(String) }
      attr_accessor :id

      # The webhook's description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Event types this webhook subscribes to. One webhook URL receives all events you
      # list here.
      sig do
        returns(
          T.nilable(
            T::Array[ModerationAPI::WebhookUpdateParams::EventType::OrSymbol]
          )
        )
      end
      attr_reader :event_types

      sig do
        params(
          event_types:
            T::Array[ModerationAPI::WebhookUpdateParams::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      # The webhook's name, used to identify it in the dashboard
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # The webhook's URL. We'll call this URL when an event occurs.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          id: String,
          description: T.nilable(String),
          event_types:
            T::Array[ModerationAPI::WebhookUpdateParams::EventType::OrSymbol],
          name: String,
          url: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the webhook to update.
        id:,
        # The webhook's description
        description: nil,
        # Event types this webhook subscribes to. One webhook URL receives all events you
        # list here.
        event_types: nil,
        # The webhook's name, used to identify it in the dashboard
        name: nil,
        # The webhook's URL. We'll call this URL when an event occurs.
        url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            description: T.nilable(String),
            event_types:
              T::Array[ModerationAPI::WebhookUpdateParams::EventType::OrSymbol],
            name: String,
            url: String,
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
            T.all(Symbol, ModerationAPI::WebhookUpdateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUE_ITEM_NEW =
          T.let(
            :QUEUE_ITEM_NEW,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_COMPLETED =
          T.let(
            :QUEUE_ITEM_COMPLETED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ACTION =
          T.let(
            :QUEUE_ITEM_ACTION,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_REJECTED =
          T.let(
            :QUEUE_ITEM_REJECTED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ALLOWED =
          T.let(
            :QUEUE_ITEM_ALLOWED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_BLOCKED =
          T.let(
            :AUTHOR_BLOCKED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_UNBLOCKED =
          T.let(
            :AUTHOR_UNBLOCKED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_SUSPENDED =
          T.let(
            :AUTHOR_SUSPENDED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_UPDATED =
          T.let(
            :AUTHOR_UPDATED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_TRUST_LEVEL_CHANGED =
          T.let(
            :AUTHOR_TRUST_LEVEL_CHANGED,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )
        AUTHOR_ACTION =
          T.let(
            :AUTHOR_ACTION,
            ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::WebhookUpdateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
