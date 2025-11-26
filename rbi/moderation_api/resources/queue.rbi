# typed: strong

module ModerationAPI
  module Resources
    class Queue
      sig { returns(ModerationAPI::Resources::Queue::Items) }
      attr_reader :items

      # Get a queue
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::QueueRetrieveResponse)
      end
      def retrieve(
        # The queue ID
        id,
        request_options: {}
      )
      end

      # Get detailed statistics about a moderation queue including review times, action
      # counts, and trends
      sig do
        params(
          id: String,
          within_days: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::QueueGetStatsResponse)
      end
      def get_stats(
        # The queue ID
        id,
        # Number of days to analyze statistics for
        within_days: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
