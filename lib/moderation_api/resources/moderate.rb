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

      # @deprecated
      #
      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze audio content
      # with your configured moderation models and filters.
      #
      # @overload analyze_audio(url:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #
      # @param url [String] The URL of the audio you want to analyze.
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel_key [String] The key of the channel.
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param context_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeAudioResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeAudioParams
      def analyze_audio(params)
        parsed, options = ModerationAPI::ModerateAnalyzeAudioParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate/audio",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeAudioResponse,
          options: options
        )
      end

      # @deprecated
      #
      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze image with
      # your Moderation API project
      #
      # @overload analyze_image(url:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #
      # @param url [String] The URL of the image you want to analyze.
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel_key [String] The key of the channel.
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param context_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeImageResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeImageParams
      def analyze_image(params)
        parsed, options = ModerationAPI::ModerateAnalyzeImageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate/image",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeImageResponse,
          options: options
        )
      end

      # @deprecated
      #
      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze an object
      # with multiple fields including text, images, video, audio. Use to moderate a
      # post, a profile, a form submission or anything that have multiple fields.
      #
      # @overload analyze_object(value:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #
      # @param value [ModerationAPI::Models::ModerateAnalyzeObjectParams::Value] The object you want to analyze.
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel_key [String] The key of the channel.
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param context_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeObjectResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeObjectParams
      def analyze_object(params)
        parsed, options = ModerationAPI::ModerateAnalyzeObjectParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate/object",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeObjectResponse,
          options: options
        )
      end

      # @deprecated
      #
      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze text content
      # with your configured moderation models and filters.
      #
      # @overload analyze_text(value:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #
      # @param value [String] The text you'd like to analyze. We recommend to submit plain text or HTML
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel_key [String] The key of the channel.
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param context_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeTextResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeTextParams
      def analyze_text(params)
        parsed, options = ModerationAPI::ModerateAnalyzeTextParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate/text",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeTextResponse,
          options: options
        )
      end

      # @deprecated
      #
      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze video content
      # with your configured moderation models and filters.
      #
      # @overload analyze_video(url:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #
      # @param url [String] The URL of the video you want to analyze.
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel_key [String] The key of the channel.
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param context_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ModerateAnalyzeVideoResponse]
      #
      # @see ModerationAPI::Models::ModerateAnalyzeVideoParams
      def analyze_video(params)
        parsed, options = ModerationAPI::ModerateAnalyzeVideoParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate/video",
          body: parsed,
          model: ModerationAPI::Models::ModerateAnalyzeVideoResponse,
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
