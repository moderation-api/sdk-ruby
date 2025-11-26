# typed: strong

module ModerationAPI
  module Resources
    class Moderate
      sig do
        params(
          content:
            T.any(
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ModerateAnalyzeParams::MetaType::OrSymbol,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeResponse)
      end
      def analyze(
        # The content sent for moderation
        content:,
        # The author of the content.
        author_id: nil,
        # Provide a channel ID or key. Will use the project's default channel if not
        # provided.
        channel: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        conversation_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        # The meta type of content being moderated
        meta_type: nil,
        request_options: {}
      )
      end

      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze audio content
      # with your configured moderation models and filters.
      sig do
        params(
          url: String,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeAudioResponse)
      end
      def analyze_audio(
        # The URL of the audio you want to analyze.
        url:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        request_options: {}
      )
      end

      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze image with
      # your Moderation API project
      sig do
        params(
          url: String,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeImageResponse)
      end
      def analyze_image(
        # The URL of the image you want to analyze.
        url:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        request_options: {}
      )
      end

      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze an object
      # with multiple fields including text, images, video, audio. Use to moderate a
      # post, a profile, a form submission or anything that have multiple fields.
      sig do
        params(
          value: ModerationAPI::ModerateAnalyzeObjectParams::Value::OrHash,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeObjectResponse)
      end
      def analyze_object(
        # The object you want to analyze.
        value:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        request_options: {}
      )
      end

      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze text content
      # with your configured moderation models and filters.
      sig do
        params(
          value: String,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeTextResponse)
      end
      def analyze_text(
        # The text you'd like to analyze. We recommend to submit plain text or HTML
        value:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        request_options: {}
      )
      end

      # (Deprecated use https://api.moderationapi.com/v1/moderate) Analyze video content
      # with your configured moderation models and filters.
      sig do
        params(
          url: String,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ModerateAnalyzeVideoResponse)
      end
      def analyze_video(
        # The URL of the video you want to analyze.
        url:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
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
