# typed: strong

module ModerationAPI
  module Resources
    class Content
      sig do
        params(
          content:
            T.any(
              ModerationAPI::ContentSubmitParams::Content::UnionMember0::OrHash,
              ModerationAPI::ContentSubmitParams::Content::UnionMember1::OrHash,
              ModerationAPI::ContentSubmitParams::Content::UnionMember2::OrHash,
              ModerationAPI::ContentSubmitParams::Content::UnionMember3::OrHash,
              ModerationAPI::ContentSubmitParams::Content::UnionMember4::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
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
