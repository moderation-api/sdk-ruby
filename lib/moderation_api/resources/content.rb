# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Content
      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::ContentSubmitParams} for more details.
      #
      # @overload submit(content:, author_id: nil, channel: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, policies: nil, timestamp: nil, request_options: {})
      #
      # @param content [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::Object] The content sent for moderation
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
      # @param meta_type [Symbol, ModerationAPI::Models::ContentSubmitParams::MetaType] The meta type of content being moderated
      #
      # @param policies [Array<ModerationAPI::Models::ContentSubmitParams::Policy::Toxicity, ModerationAPI::Models::ContentSubmitParams::Policy::PersonalInformation, ModerationAPI::Models::ContentSubmitParams::Policy::ToxicitySevere, ModerationAPI::Models::ContentSubmitParams::Policy::Hate, ModerationAPI::Models::ContentSubmitParams::Policy::Illicit, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitDrugs, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitAlcohol, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitFirearms, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitTobacco, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitGambling, ModerationAPI::Models::ContentSubmitParams::Policy::Cannabis, ModerationAPI::Models::ContentSubmitParams::Policy::Sexual, ModerationAPI::Models::ContentSubmitParams::Policy::Flirtation, ModerationAPI::Models::ContentSubmitParams::Policy::Profanity, ModerationAPI::Models::ContentSubmitParams::Policy::Violence, ModerationAPI::Models::ContentSubmitParams::Policy::SelfHarm, ModerationAPI::Models::ContentSubmitParams::Policy::Spam, ModerationAPI::Models::ContentSubmitParams::Policy::SelfPromotion, ModerationAPI::Models::ContentSubmitParams::Policy::Political, ModerationAPI::Models::ContentSubmitParams::Policy::Religion, ModerationAPI::Models::ContentSubmitParams::Policy::CodeAbuse, ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking, ModerationAPI::Models::ContentSubmitParams::Policy::Guideline>] (Enterprise) override the channel policies for this moderation request only.
      #
      # @param timestamp [Float] Unix timestamp (in milliseconds) of when the content was created. Use if content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ContentSubmitResponse]
      #
      # @see ModerationAPI::Models::ContentSubmitParams
      def submit(params)
        parsed, options = ModerationAPI::ContentSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate",
          body: parsed,
          model: ModerationAPI::Models::ContentSubmitResponse,
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
