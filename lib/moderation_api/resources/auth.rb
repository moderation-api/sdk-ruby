# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Auth
      # @deprecated
      #
      # @overload create(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthCreateResponse]
      #
      # @see ModerationAPI::Models::AuthCreateParams
      def create(params = {})
        @client.request(
          method: :post,
          path: "auth",
          model: ModerationAPI::Models::AuthCreateResponse,
          options: params[:request_options]
        )
      end

      # @deprecated
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthRetrieveResponse]
      #
      # @see ModerationAPI::Models::AuthRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "auth",
          model: ModerationAPI::Models::AuthRetrieveResponse,
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
