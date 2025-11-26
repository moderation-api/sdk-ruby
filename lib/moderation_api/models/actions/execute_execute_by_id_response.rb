# frozen_string_literal: true

module ModerationAPI
  module Models
    module Actions
      # @see ModerationAPI::Resources::Actions::Execute#execute_by_id
      class ExecuteExecuteByIDResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute action_id
        #   The ID of the action.
        #
        #   @return [String]
        required :action_id, String, api_name: :actionId

        # @!attribute ids
        #   The IDs of the content items.
        #
        #   @return [Array<String>]
        required :ids, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute success
        #   Action executed successfully.
        #
        #   @return [Boolean]
        required :success, ModerationAPI::Internal::Type::Boolean

        # @!method initialize(action_id:, ids:, success:)
        #   @param action_id [String] The ID of the action.
        #
        #   @param ids [Array<String>] The IDs of the content items.
        #
        #   @param success [Boolean] Action executed successfully.
      end
    end
  end
end
