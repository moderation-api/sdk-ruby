# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeTextParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ModerateAnalyzeTextParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The text you'd like to analyze. We recommend to submit plain text or HTML
      sig { returns(String) }
      attr_accessor :value

      # The author of the content.
      sig { returns(T.nilable(String)) }
      attr_reader :author_id

      sig { params(author_id: String).void }
      attr_writer :author_id

      # The key of the channel.
      sig { returns(T.nilable(String)) }
      attr_reader :channel_key

      sig { params(channel_key: String).void }
      attr_writer :channel_key

      # The unique ID of the content in your database.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # For example the ID of a chat room or a post
      sig { returns(T.nilable(String)) }
      attr_reader :context_id

      sig { params(context_id: String).void }
      attr_writer :context_id

      # Do not store the content. The content won't enter the review queue
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :do_not_store

      sig { params(do_not_store: T::Boolean).void }
      attr_writer :do_not_store

      # Any metadata you want to store with the content
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :metadata

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            value: String,
            author_id: String,
            channel_key: String,
            content_id: String,
            context_id: String,
            do_not_store: T::Boolean,
            metadata: T::Hash[Symbol, T.anything],
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
