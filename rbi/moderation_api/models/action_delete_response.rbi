# typed: strong

module ModerationAPI
  module Models
    class ActionDeleteResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ActionDeleteResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The ID of the action.
      sig { returns(String) }
      attr_accessor :id

      # Whether the action was deleted.
      sig { returns(T::Boolean) }
      attr_accessor :deleted

      sig { params(id: String, deleted: T::Boolean).returns(T.attached_class) }
      def self.new(
        # The ID of the action.
        id:,
        # Whether the action was deleted.
        deleted:
      )
      end

      sig { override.returns({ id: String, deleted: T::Boolean }) }
      def to_hash
      end
    end
  end
end
