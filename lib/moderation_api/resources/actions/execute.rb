# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Actions
      class Execute
        # Execute a moderation action on one or more content items.
        #
        # @overload execute(action_key:, author_ids: nil, content_ids: nil, duration: nil, queue_id: nil, value: nil, request_options: {})
        #
        # @param action_key [String] ID or key of the action to execute
        #
        # @param author_ids [Array<String>] IDs of the authors to apply the action to. Provide this or contentIds.
        #
        # @param content_ids [Array<String>] IDs of the content items to apply the action to. Provide this or authorIds.
        #
        # @param duration [Float] Optional duration in milliseconds for actions with timeouts
        #
        # @param queue_id [String] Optional queue ID if the action is queue-specific
        #
        # @param value [String] Optional value to provide with the action
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Actions::ExecuteExecuteResponse]
        #
        # @see ModerationAPI::Models::Actions::ExecuteExecuteParams
        def execute(params)
          parsed, options = ModerationAPI::Actions::ExecuteExecuteParams.dump_request(params)
          @client.request(
            method: :post,
            path: "actions/execute",
            body: parsed,
            model: ModerationAPI::Models::Actions::ExecuteExecuteResponse,
            options: options
          )
        end

        # @deprecated
        #
        # Execute an action on a set of content items in a queue.
        #
        # @overload execute_by_id(action_id, author_ids: nil, content_ids: nil, queue_id: nil, value: nil, request_options: {})
        #
        # @param action_id [String] The ID or key of the action to execute.
        #
        # @param author_ids [Array<String>] IDs of the authors to apply the action to
        #
        # @param content_ids [Array<String>] The IDs of the content items to perform the action on.
        #
        # @param queue_id [String] The ID of the queue the action was performed from if any.
        #
        # @param value [String] The value of the action. Useful to set a reason for the action etc.
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Actions::ExecuteExecuteByIDResponse]
        #
        # @see ModerationAPI::Models::Actions::ExecuteExecuteByIDParams
        def execute_by_id(action_id, params = {})
          parsed, options = ModerationAPI::Actions::ExecuteExecuteByIDParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["actions/%1$s/execute", action_id],
            body: parsed,
            model: ModerationAPI::Models::Actions::ExecuteExecuteByIDResponse,
            options: options
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
end
