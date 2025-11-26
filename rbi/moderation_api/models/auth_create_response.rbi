# typed: strong

module ModerationAPI
  module Models
    class AuthCreateResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::AuthCreateResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Message of the authentication
      sig { returns(String) }
      attr_accessor :message

      # Name of the authenticated project
      sig { returns(String) }
      attr_accessor :project

      # Status of the authentication
      sig { returns(String) }
      attr_accessor :status

      sig do
        params(message: String, project: String, status: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Message of the authentication
        message:,
        # Name of the authenticated project
        project:,
        # Status of the authentication
        status:
      )
      end

      sig do
        override.returns({ message: String, project: String, status: String })
      end
      def to_hash
      end
    end
  end
end
