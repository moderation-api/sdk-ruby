# typed: strong

module ModerationAPI
  module Resources
    class Content
      sig do
        params(
          content:
            T.any(
              ModerationAPI::ContentSubmitParams::Content::Text::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Image::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Video::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Audio::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Object::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
          policies:
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Toxicity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PersonalInformation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Hate::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Illicit::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitGambling::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Cannabis::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Adult::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Crypto::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Sexual::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Flirtation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Profanity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Violence::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfHarm::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Spam::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfPromotion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Political::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Religion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::CodeAbuse::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::URLMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Guideline::OrHash
              )
            ],
          timestamp: Float,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::ContentSubmitResponse)
      end
      def submit(
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
        # (Enterprise) override the channel policies for this moderation request only.
        policies: nil,
        # Unix timestamp (in milliseconds) of when the content was created. Use if content
        # is not submitted in real-time.
        timestamp: nil,
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
