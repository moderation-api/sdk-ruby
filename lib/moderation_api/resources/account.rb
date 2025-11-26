# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Account
      # Get account details
      #
      # @overload list(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AccountListResponse]
      #
      # @see ModerationAPI::Models::AccountListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "account",
          model: ModerationAPI::Models::AccountListResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
