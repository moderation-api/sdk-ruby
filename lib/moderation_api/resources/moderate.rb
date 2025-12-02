# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Moderate
      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::ModerateAnalyzeParams} for more details.
      #
      # @overload analyze(content:, author_id: nil, channel: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, request_options: {})
      #
      # @param content [ModerationAPI::Models::ModerateAnalyzeParams::Content::UnionMember0, ModerationAPI::Models::ModerateAnalyzeParams::Content::UnionMember1, ModerationAPI::Models::ModerateAnalyzeParams::Content::UnionMember2, ModerationAPI::Models::ModerateAnalyzeParams::Content::UnionMember3, ModerationAPI::Models::ModerateAnalyzeParams::Content::UnionMember4] The content sent for moderation
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel [String] Provide a channel ID or key. Will use the project's default channel if not provi
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param conversation_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param meta_type [Symbol, ModerationAPI::Models::ModerateAnalyzeParams::MetaType] The meta type of content being moderated
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeParams
      def analyze(params)
        parsed, options = ModerationAPI::ModerateAnalyzeParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeResponse,
          options: options
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
