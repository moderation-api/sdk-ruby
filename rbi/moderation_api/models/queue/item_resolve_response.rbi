# typed: strong

module ModerationAPI
  module Models
    module Queue
      class ItemResolveResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Queue::ItemResolveResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Timestamp when the item was resolved
        sig { returns(String) }
        attr_accessor :resolved_at

        sig { returns(T::Boolean) }
        attr_accessor :success

        # Optional comment
        sig { returns(T.nilable(String)) }
        attr_reader :comment

        sig { params(comment: String).void }
        attr_writer :comment

        sig do
          params(
            resolved_at: String,
            success: T::Boolean,
            comment: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Timestamp when the item was resolved
          resolved_at:,
          success:,
          # Optional comment
          comment: nil
        )
        end

        sig do
          override.returns(
            { resolved_at: String, success: T::Boolean, comment: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
