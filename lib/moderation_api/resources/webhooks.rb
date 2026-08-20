# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::WebhookCreateParams} for more details.
      #
      # Create a webhook subscribed to one or more event types. Deliveries use the v2
      # envelope and are signed with the project signing secret (see the signing secret
      # endpoint).
      #
      # @overload create(event_types:, name:, url:, description: nil, request_options: {})
      #
      # @param event_types [Array<Symbol, ModerationAPI::Models::WebhookCreateParams::EventType>] Event types this webhook subscribes to. One webhook URL receives all events you
      #
      # @param name [String] The webhook's name, used to identify it in the dashboard
      #
      # @param url [String] The webhook's URL. We'll call this URL when an event occurs.
      #
      # @param description [String, nil] The webhook's description
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WebhookCreateResponse]
      #
      # @see ModerationAPI::Models::WebhookCreateParams
      def create(params)
        parsed, options = ModerationAPI::WebhookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "webhooks",
          body: parsed,
          model: ModerationAPI::Models::WebhookCreateResponse,
          options: options
        )
      end

      # Get a webhook by ID.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the webhook to get.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WebhookRetrieveResponse]
      #
      # @see ModerationAPI::Models::WebhookRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["webhooks/%1$s", id],
          model: ModerationAPI::Models::WebhookRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::WebhookUpdateParams} for more details.
      #
      # Update a webhook. Legacy v1 webhooks are read-only: delete them and create a new
      # webhook instead.
      #
      # @overload update(id, description: nil, event_types: nil, name: nil, url: nil, request_options: {})
      #
      # @param id [String] The ID of the webhook to update.
      #
      # @param description [String, nil] The webhook's description
      #
      # @param event_types [Array<Symbol, ModerationAPI::Models::WebhookUpdateParams::EventType>] Event types this webhook subscribes to. One webhook URL receives all events you
      #
      # @param name [String] The webhook's name, used to identify it in the dashboard
      #
      # @param url [String] The webhook's URL. We'll call this URL when an event occurs.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WebhookUpdateResponse]
      #
      # @see ModerationAPI::Models::WebhookUpdateParams
      def update(id, params = {})
        parsed, options = ModerationAPI::WebhookUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["webhooks/%1$s", id],
          body: parsed,
          model: ModerationAPI::Models::WebhookUpdateResponse,
          options: options
        )
      end

      # List all webhooks for the authenticated project.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<ModerationAPI::Models::WebhookListResponseItem>]
      #
      # @see ModerationAPI::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "webhooks",
          model: ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::WebhookListResponseItem],
          options: params[:request_options]
        )
      end

      # Delete a webhook.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The ID of the webhook to delete.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WebhookDeleteResponse]
      #
      # @see ModerationAPI::Models::WebhookDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["webhooks/%1$s", id],
          model: ModerationAPI::Models::WebhookDeleteResponse,
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
