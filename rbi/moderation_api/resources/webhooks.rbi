# typed: strong

module ModerationAPI
  module Resources
    class Webhooks
      # Create a webhook subscribed to one or more event types. Deliveries use the v2
      # envelope and are signed with the project signing secret (see the signing secret
      # endpoint).
      sig do
        params(
          event_types:
            T::Array[ModerationAPI::WebhookCreateParams::EventType::OrSymbol],
          name: String,
          url: String,
          description: T.nilable(String),
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WebhookCreateResponse)
      end
      def create(
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

      # Get a webhook by ID.
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WebhookRetrieveResponse)
      end
      def retrieve(
        # The ID of the webhook to get.
        id,
        request_options: {}
      )
      end

      # Update a webhook. Legacy v1 webhooks are read-only: delete them and create a new
      # webhook instead.
      sig do
        params(
          id: String,
          description: T.nilable(String),
          event_types:
            T::Array[ModerationAPI::WebhookUpdateParams::EventType::OrSymbol],
          name: String,
          url: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WebhookUpdateResponse)
      end
      def update(
        # The ID of the webhook to update.
        id,
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

      # List all webhooks for the authenticated project.
      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          T::Array[ModerationAPI::Models::WebhookListResponseItem]
        )
      end
      def list(request_options: {})
      end

      # Delete a webhook.
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WebhookDeleteResponse)
      end
      def delete(
        # The ID of the webhook to delete.
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
