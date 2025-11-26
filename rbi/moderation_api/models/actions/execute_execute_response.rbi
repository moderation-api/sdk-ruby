# typed: strong

module ModerationAPI
  module Models
    module Actions
      class ExecuteExecuteResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Actions::ExecuteExecuteResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Whether the action was executed successfully
        sig { returns(T::Boolean) }
        attr_accessor :success

        # Execution result
        sig { params(success: T::Boolean).returns(T.attached_class) }
        def self.new(
          # Whether the action was executed successfully
          success:
        )
        end

        sig { override.returns({ success: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
