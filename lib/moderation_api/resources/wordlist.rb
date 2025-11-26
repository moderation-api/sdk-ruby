# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Wordlist
      # @return [ModerationAPI::Resources::Wordlist::Words]
      attr_reader :words

      # Get a specific wordlist by ID
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] ID of the wordlist to get
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WordlistRetrieveResponse]
      #
      # @see ModerationAPI::Models::WordlistRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["wordlist/%1$s", id],
          model: ModerationAPI::Models::WordlistRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::WordlistUpdateParams} for more details.
      #
      # Update a wordlist
      #
      # @overload update(id, description: nil, key: nil, name: nil, strict: nil, words: nil, request_options: {})
      #
      # @param id [String] ID of the wordlist to update
      #
      # @param description [String] New description for the wordlist
      #
      # @param key [String] New key for the wordlist
      #
      # @param name [String] New name for the wordlist
      #
      # @param strict [Boolean] Deprecated. Now using threshold in project settings.
      #
      # @param words [Array<String>] New words for the wordlist. Replace the existing words with these new ones. Dupl
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WordlistUpdateResponse]
      #
      # @see ModerationAPI::Models::WordlistUpdateParams
      def update(id, params = {})
        parsed, options = ModerationAPI::WordlistUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["wordlist/%1$s", id],
          body: parsed,
          model: ModerationAPI::Models::WordlistUpdateResponse,
          options: options
        )
      end

      # List all wordlists for the authenticated organization
      #
      # @overload list(request_options: {})
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<ModerationAPI::Models::WordlistListResponseItem>]
      #
      # @see ModerationAPI::Models::WordlistListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "wordlist",
          model: ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::WordlistListResponseItem],
          options: params[:request_options]
        )
      end

      # Get the current embedding progress status for a wordlist
      #
      # @overload get_embedding_status(id, request_options: {})
      #
      # @param id [String] ID of the wordlist to check embedding status for
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::WordlistGetEmbeddingStatusResponse]
      #
      # @see ModerationAPI::Models::WordlistGetEmbeddingStatusParams
      def get_embedding_status(id, params = {})
        @client.request(
          method: :get,
          path: ["wordlist/%1$s/embedding-status", id],
          model: ModerationAPI::Models::WordlistGetEmbeddingStatusResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
        @words = ModerationAPI::Resources::Wordlist::Words.new(client: client)
      end
    end
  end
end
