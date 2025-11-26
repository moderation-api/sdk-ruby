# typed: strong

module ModerationAPI
  module Resources
    class Auth
      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          ModerationAPI::Models::AuthCreateResponse
        )
      end
      def create(request_options: {})
      end

      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          ModerationAPI::Models::AuthRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
