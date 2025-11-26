# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Queue
      # @return [ModerationAPI::Resources::Queue::Items]
      attr_reader :items

      # Get a queue
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The queue ID
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::QueueRetrieveResponse]
      #
      # @see ModerationAPI::Models::QueueRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["queue/%1$s", id],
          model: ModerationAPI::Models::QueueRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Get detailed statistics about a moderation queue including review times, action
      # counts, and trends
      #
      # @overload get_stats(id, within_days: nil, request_options: {})
      #
      # @param id [String] The queue ID
      #
      # @param within_days [String] Number of days to analyze statistics for
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::QueueGetStatsResponse]
      #
      # @see ModerationAPI::Models::QueueGetStatsParams
      def get_stats(id, params = {})
        parsed, options = ModerationAPI::QueueGetStatsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["queue/%1$s/stats", id],
          query: parsed.transform_keys(within_days: "withinDays"),
          model: ModerationAPI::Models::QueueGetStatsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
        @items = ModerationAPI::Resources::Queue::Items.new(client: client)
      end
    end
  end
end
