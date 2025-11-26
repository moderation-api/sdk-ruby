# frozen_string_literal: true

module ModerationAPI
  module Models
    module Actions
      # @see ModerationAPI::Resources::Actions::Execute#execute
      class ExecuteExecuteResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute success
        #   Whether the action was executed successfully
        #
        #   @return [Boolean]
        required :success, ModerationAPI::Internal::Type::Boolean

        # @!method initialize(success:)
        #   Execution result
        #
        #   @param success [Boolean] Whether the action was executed successfully
      end
    end
  end
end
