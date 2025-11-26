# typed: strong

module ModerationAPI
  module Resources
    class Actions
      sig { returns(ModerationAPI::Resources::Actions::Execute) }
      attr_reader :execute

      # Create an action.
      sig do
        params(
          name: String,
          built_in: T.nilable(T::Boolean),
          description: T.nilable(String),
          filter_in_queue_ids: T::Array[String],
          free_text: T::Boolean,
          key: T.nilable(String),
          position: ModerationAPI::ActionCreateParams::Position::OrSymbol,
          possible_values:
            T::Array[ModerationAPI::ActionCreateParams::PossibleValue::OrHash],
          queue_behaviour:
            ModerationAPI::ActionCreateParams::QueueBehaviour::OrSymbol,
          type: T.nilable(ModerationAPI::ActionCreateParams::Type::OrSymbol),
          value_required: T::Boolean,
          webhooks:
            T::Array[ModerationAPI::ActionCreateParams::Webhook::OrHash],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ActionCreateResponse)
      end
      def create(
        # The name of the action.
        name:,
        # Whether the action is a built-in action or a custom one.
        built_in: nil,
        # The description of the action.
        description: nil,
        # The IDs of the queues the action is available in.
        filter_in_queue_ids: nil,
        # Whether the action allows any text to be entered as a value or if it must be one
        # of the possible values.
        free_text: nil,
        # User defined key of the action.
        key: nil,
        # Show the action in all queues, selected queues or no queues (to use via API
        # only).
        position: nil,
        # The possible values of the action. The user will be prompted to select one of
        # these values when executing the action.
        possible_values: nil,
        # Whether the action resolves and removes the item, unresolves and re-add it to
        # the queue, or does not change the resolve status.
        queue_behaviour: nil,
        # The type of the action.
        type: nil,
        # Whether the action requires a value to be executed.
        value_required: nil,
        # The action's webhooks.
        webhooks: nil,
        request_options: {}
      )
      end

      # Get an action by ID.
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ActionRetrieveResponse)
      end
      def retrieve(
        # The ID of the action to get.
        id,
        request_options: {}
      )
      end

      # Update an action.
      sig do
        params(
          id: String,
          built_in: T.nilable(T::Boolean),
          description: T.nilable(String),
          filter_in_queue_ids: T::Array[String],
          free_text: T::Boolean,
          key: T.nilable(String),
          name: String,
          position: ModerationAPI::ActionUpdateParams::Position::OrSymbol,
          possible_values:
            T::Array[ModerationAPI::ActionUpdateParams::PossibleValue::OrHash],
          queue_behaviour:
            ModerationAPI::ActionUpdateParams::QueueBehaviour::OrSymbol,
          type: T.nilable(ModerationAPI::ActionUpdateParams::Type::OrSymbol),
          value_required: T::Boolean,
          webhooks:
            T::Array[ModerationAPI::ActionUpdateParams::Webhook::OrHash],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ActionUpdateResponse)
      end
      def update(
        # The ID of the action to update.
        id,
        # Whether the action is a built-in action or a custom one.
        built_in: nil,
        # The description of the action.
        description: nil,
        # The IDs of the queues the action is available in.
        filter_in_queue_ids: nil,
        # Whether the action allows any text to be entered as a value or if it must be one
        # of the possible values.
        free_text: nil,
        # User defined key of the action.
        key: nil,
        # The name of the action.
        name: nil,
        # Show the action in all queues, selected queues or no queues (to use via API
        # only).
        position: nil,
        # The possible values of the action. The user will be prompted to select one of
        # these values when executing the action.
        possible_values: nil,
        # Whether the action resolves and removes the item, unresolves and re-add it to
        # the queue, or does not change the resolve status.
        queue_behaviour: nil,
        # The type of the action.
        type: nil,
        # Whether the action requires a value to be executed.
        value_required: nil,
        # The action's webhooks.
        webhooks: nil,
        request_options: {}
      )
      end

      # List all available moderation actions for the authenticated organization.
      sig do
        params(
          queue_id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T::Array[ModerationAPI::Models::ActionListResponseItem])
      end
      def list(queue_id: nil, request_options: {})
      end

      # Delete an action and all of its webhooks.
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ActionDeleteResponse)
      end
      def delete(
        # The ID of the action to delete.
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
