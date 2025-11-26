# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Actions
      # @return [ModerationAPI::Resources::Actions::Execute]
      attr_reader :execute

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::ActionCreateParams} for more details.
      #
      # Create an action.
      #
      # @overload create(name:, built_in: nil, description: nil, filter_in_queue_ids: nil, free_text: nil, key: nil, position: nil, possible_values: nil, queue_behaviour: nil, type: nil, value_required: nil, webhooks: nil, request_options: {})
      #
      # @param name [String] The name of the action.
      #
      # @param built_in [Boolean, nil] Whether the action is a built-in action or a custom one.
      #
      # @param description [String, nil] The description of the action.
      #
      # @param filter_in_queue_ids [Array<String>] The IDs of the queues the action is available in.
      #
      # @param free_text [Boolean] Whether the action allows any text to be entered as a value or if it must be one
      #
      # @param key [String, nil] User defined key of the action.
      #
      # @param position [Symbol, ModerationAPI::Models::ActionCreateParams::Position] Show the action in all queues, selected queues or no queues (to use via API only
      #
      # @param possible_values [Array<ModerationAPI::Models::ActionCreateParams::PossibleValue>] The possible values of the action. The user will be prompted to select one of th
      #
      # @param queue_behaviour [Symbol, ModerationAPI::Models::ActionCreateParams::QueueBehaviour] Whether the action resolves and removes the item, unresolves and re-add it to th
      #
      # @param type [Symbol, ModerationAPI::Models::ActionCreateParams::Type, nil] The type of the action.
      #
      # @param value_required [Boolean] Whether the action requires a value to be executed.
      #
      # @param webhooks [Array<ModerationAPI::Models::ActionCreateParams::Webhook>] The action's webhooks.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ActionCreateResponse]
      #
      # @see ModerationAPI::Models::ActionCreateParams
      def create(params)
        parsed, options = ModerationAPI::ActionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "actions",
          body: parsed,
          model: ModerationAPI::Models::ActionCreateResponse,
          options: options
        )
      end

      # Get an action by ID.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the action to get.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ActionRetrieveResponse]
      #
      # @see ModerationAPI::Models::ActionRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["actions/%1$s", id],
          model: ModerationAPI::Models::ActionRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::ActionUpdateParams} for more details.
      #
      # Update an action.
      #
      # @overload update(id, built_in: nil, description: nil, filter_in_queue_ids: nil, free_text: nil, key: nil, name: nil, position: nil, possible_values: nil, queue_behaviour: nil, type: nil, value_required: nil, webhooks: nil, request_options: {})
      #
      # @param id [String] The ID of the action to update.
      #
      # @param built_in [Boolean, nil] Whether the action is a built-in action or a custom one.
      #
      # @param description [String, nil] The description of the action.
      #
      # @param filter_in_queue_ids [Array<String>] The IDs of the queues the action is available in.
      #
      # @param free_text [Boolean] Whether the action allows any text to be entered as a value or if it must be one
      #
      # @param key [String, nil] User defined key of the action.
      #
      # @param name [String] The name of the action.
      #
      # @param position [Symbol, ModerationAPI::Models::ActionUpdateParams::Position] Show the action in all queues, selected queues or no queues (to use via API only
      #
      # @param possible_values [Array<ModerationAPI::Models::ActionUpdateParams::PossibleValue>] The possible values of the action. The user will be prompted to select one of th
      #
      # @param queue_behaviour [Symbol, ModerationAPI::Models::ActionUpdateParams::QueueBehaviour] Whether the action resolves and removes the item, unresolves and re-add it to th
      #
      # @param type [Symbol, ModerationAPI::Models::ActionUpdateParams::Type, nil] The type of the action.
      #
      # @param value_required [Boolean] Whether the action requires a value to be executed.
      #
      # @param webhooks [Array<ModerationAPI::Models::ActionUpdateParams::Webhook>] The action's webhooks.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ActionUpdateResponse]
      #
      # @see ModerationAPI::Models::ActionUpdateParams
      def update(id, params = {})
        parsed, options = ModerationAPI::ActionUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["actions/%1$s", id],
          body: parsed,
          model: ModerationAPI::Models::ActionUpdateResponse,
          options: options
        )
      end

      # List all available moderation actions for the authenticated organization.
      #
      # @overload list(queue_id: nil, request_options: {})
      #
      # @param queue_id [String]
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<ModerationAPI::Models::ActionListResponseItem>]
      #
      # @see ModerationAPI::Models::ActionListParams
      def list(params = {})
        parsed, options = ModerationAPI::ActionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "actions",
          query: parsed.transform_keys(queue_id: "queueId"),
          model: ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionListResponseItem],
          options: options
        )
      end

      # Delete an action and all of its webhooks.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The ID of the action to delete.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ActionDeleteResponse]
      #
      # @see ModerationAPI::Models::ActionDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["actions/%1$s", id],
          model: ModerationAPI::Models::ActionDeleteResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
        @execute = ModerationAPI::Resources::Actions::Execute.new(client: client)
      end
    end
  end
end
