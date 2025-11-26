# typed: strong

module ModerationAPI
  module Models
    class AuthorDeleteResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::AuthorDeleteResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig { params(success: T::Boolean).returns(T.attached_class) }
      def self.new(success:)
      end

      sig { override.returns({ success: T::Boolean }) }
      def to_hash
      end
    end
  end
end
