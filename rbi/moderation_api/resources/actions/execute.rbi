# typed: strong

module ModerationAPI
  module Resources
    class Actions
      class Execute
        # Execute a moderation action on one or more content items.
        sig do
          params(
            action_key: String,
            author_ids: T::Array[String],
            content_ids: T::Array[String],
            duration: Float,
            queue_id: String,
            value: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Actions::ExecuteExecuteResponse)
        end
        def execute(
          # ID or key of the action to execute
          action_key:,
          # IDs of the authors to apply the action to. Provide this or contentIds.
          author_ids: nil,
          # IDs of the content items to apply the action to. Provide this or authorIds.
          content_ids: nil,
          # Optional duration in milliseconds for actions with timeouts
          duration: nil,
          # Optional queue ID if the action is queue-specific
          queue_id: nil,
          # Optional value to provide with the action
          value: nil,
          request_options: {}
        )
        end

        # Execute an action on a set of content items in a queue.
        sig do
          params(
            action_id: String,
            author_ids: T::Array[String],
            content_ids: T::Array[String],
            queue_id: String,
            value: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Actions::ExecuteExecuteByIDResponse)
        end
        def execute_by_id(
          # The ID or key of the action to execute.
          action_id,
          # IDs of the authors to apply the action to
          author_ids: nil,
          # The IDs of the content items to perform the action on.
          content_ids: nil,
          # The ID of the queue the action was performed from if any.
          queue_id: nil,
          # The value of the action. Useful to set a reason for the action etc.
          value: nil,
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
end
