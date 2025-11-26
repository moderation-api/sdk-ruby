# typed: strong

module ModerationAPI
  module Models
    module Actions
      class ExecuteExecuteByIDResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Actions::ExecuteExecuteByIDResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The ID of the action.
        sig { returns(String) }
        attr_accessor :action_id

        # The IDs of the content items.
        sig { returns(T::Array[String]) }
        attr_accessor :ids

        # Action executed successfully.
        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            action_id: String,
            ids: T::Array[String],
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the action.
          action_id:,
          # The IDs of the content items.
          ids:,
          # Action executed successfully.
          success:
        )
        end

        sig do
          override.returns(
            { action_id: String, ids: T::Array[String], success: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
