# typed: strong

module ModerationAPI
  module Models
    class WebhookListResponseItem < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::WebhookListResponseItem,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The ID of the webhook.
      sig { returns(String) }
      attr_accessor :id

      # The date the webhook was created.
      sig { returns(String) }
      attr_accessor :created_at

      # Event types this webhook subscribes to. Empty for legacy v1 webhooks, which
      # subscribe via their single deprecated `type` instead.
      sig do
        returns(
          T::Array[
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          ]
        )
      end
      attr_accessor :event_types

      # The webhook's name.
      sig { returns(String) }
      attr_accessor :name

      # Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
      # shape and is read-only via this API.
      sig do
        returns(
          ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::TaggedSymbol
        )
      end
      attr_accessor :payload_version

      # The URL we call when a subscribed event occurs.
      sig { returns(String) }
      attr_accessor :url

      # The webhook's description.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        params(
          id: String,
          created_at: String,
          event_types:
            T::Array[
              ModerationAPI::Models::WebhookListResponseItem::EventType::OrSymbol
            ],
          name: String,
          payload_version:
            ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::OrSymbol,
          url: String,
          description: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the webhook.
        id:,
        # The date the webhook was created.
        created_at:,
        # Event types this webhook subscribes to. Empty for legacy v1 webhooks, which
        # subscribe via their single deprecated `type` instead.
        event_types:,
        # The webhook's name.
        name:,
        # Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
        # shape and is read-only via this API.
        payload_version:,
        # The URL we call when a subscribed event occurs.
        url:,
        # The webhook's description.
        description: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            event_types:
              T::Array[
                ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
              ],
            name: String,
            payload_version:
              ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::TaggedSymbol,
            url: String,
            description: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module EventType
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ModerationAPI::Models::WebhookListResponseItem::EventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUE_ITEM_NEW =
          T.let(
            :QUEUE_ITEM_NEW,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        QUEUE_ITEM_COMPLETED =
          T.let(
            :QUEUE_ITEM_COMPLETED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ACTION =
          T.let(
            :QUEUE_ITEM_ACTION,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        QUEUE_ITEM_REJECTED =
          T.let(
            :QUEUE_ITEM_REJECTED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        QUEUE_ITEM_ALLOWED =
          T.let(
            :QUEUE_ITEM_ALLOWED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_BLOCKED =
          T.let(
            :AUTHOR_BLOCKED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_UNBLOCKED =
          T.let(
            :AUTHOR_UNBLOCKED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_SUSPENDED =
          T.let(
            :AUTHOR_SUSPENDED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_UPDATED =
          T.let(
            :AUTHOR_UPDATED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_TRUST_LEVEL_CHANGED =
          T.let(
            :AUTHOR_TRUST_LEVEL_CHANGED,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )
        AUTHOR_ACTION =
          T.let(
            :AUTHOR_ACTION,
            ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::WebhookListResponseItem::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat
      # shape and is read-only via this API.
      module PayloadVersion
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ModerationAPI::Models::WebhookListResponseItem::PayloadVersion
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        V1 =
          T.let(
            :V1,
            ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::TaggedSymbol
          )
        V2 =
          T.let(
            :V2,
            ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::WebhookListResponseItem::PayloadVersion::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end

    WebhookListResponse =
      T.let(
        ModerationAPI::Internal::Type::ArrayOf[
          ModerationAPI::Models::WebhookListResponseItem
        ],
        ModerationAPI::Internal::Type::Converter
      )
  end
end
