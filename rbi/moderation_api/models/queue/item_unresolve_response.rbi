# typed: strong

module ModerationAPI
  module Models
    module Queue
      class ItemUnresolveResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Queue::ItemUnresolveResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # New status of the item
        sig { returns(String) }
        attr_accessor :status

        sig { returns(T::Boolean) }
        attr_accessor :success

        # Timestamp when the item was unresolved
        sig { returns(String) }
        attr_accessor :unresolved_at

        sig do
          params(
            status: String,
            success: T::Boolean,
            unresolved_at: String
          ).returns(T.attached_class)
        end
        def self.new(
          # New status of the item
          status:,
          success:,
          # Timestamp when the item was unresolved
          unresolved_at:
        )
        end

        sig do
          override.returns(
            { status: String, success: T::Boolean, unresolved_at: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
