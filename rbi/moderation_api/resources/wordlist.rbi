# typed: strong

module ModerationAPI
  module Resources
    class Wordlist
      sig { returns(ModerationAPI::Resources::Wordlist::Words) }
      attr_reader :words

      # Get a specific wordlist by ID
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WordlistRetrieveResponse)
      end
      def retrieve(
        # ID of the wordlist to get
        id,
        request_options: {}
      )
      end

      # Update a wordlist
      sig do
        params(
          id: String,
          description: String,
          key: String,
          name: String,
          strict: T::Boolean,
          words: T::Array[String],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WordlistUpdateResponse)
      end
      def update(
        # ID of the wordlist to update
        id,
        # New description for the wordlist
        description: nil,
        # New key for the wordlist
        key: nil,
        # New name for the wordlist
        name: nil,
        # Deprecated. Now using threshold in project settings.
        strict: nil,
        # New words for the wordlist. Replace the existing words with these new ones.
        # Duplicate words will be ignored.
        words: nil,
        request_options: {}
      )
      end

      # List all wordlists for the authenticated organization
      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          T::Array[ModerationAPI::Models::WordlistListResponseItem]
        )
      end
      def list(request_options: {})
      end

      # Get the current embedding progress status for a wordlist
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::WordlistGetEmbeddingStatusResponse)
      end
      def get_embedding_status(
        # ID of the wordlist to check embedding status for
        id,
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
