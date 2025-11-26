# typed: strong

module ModerationAPI
  module Models
    class AuthRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::AuthRetrieveResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Message of the authentication
      sig { returns(String) }
      attr_accessor :message

      # Status of the authentication
      sig { returns(String) }
      attr_accessor :status

      sig { params(message: String, status: String).returns(T.attached_class) }
      def self.new(
        # Message of the authentication
        message:,
        # Status of the authentication
        status:
      )
      end

      sig { override.returns({ message: String, status: String }) }
      def to_hash
      end
    end
  end
end
