# typed: strong

module ModerationAPI
  module Resources
    class Account
      # Get account details
      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          ModerationAPI::Models::AccountListResponse
        )
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
