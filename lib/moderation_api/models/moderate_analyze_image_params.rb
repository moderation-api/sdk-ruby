# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Moderate#analyze_image
    class ModerateAnalyzeImageParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute url
      #   The URL of the image you want to analyze.
      #
      #   @return [String]
      required :url, String

      # @!attribute author_id
      #   The author of the content.
      #
      #   @return [String, nil]
      optional :author_id, String, api_name: :authorId

      # @!attribute channel_key
      #   The key of the channel.
      #
      #   @return [String, nil]
      optional :channel_key, String, api_name: :channelKey

      # @!attribute content_id
      #   The unique ID of the content in your database.
      #
      #   @return [String, nil]
      optional :content_id, String, api_name: :contentId

      # @!attribute context_id
      #   For example the ID of a chat room or a post
      #
      #   @return [String, nil]
      optional :context_id, String, api_name: :contextId

      # @!attribute do_not_store
      #   Do not store the content. The content won't enter the review queue
      #
      #   @return [Boolean, nil]
      optional :do_not_store, ModerationAPI::Internal::Type::Boolean, api_name: :doNotStore

      # @!attribute metadata
      #   Any metadata you want to store with the content
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :metadata, ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown]

      # @!method initialize(url:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #   @param url [String] The URL of the image you want to analyze.
      #
      #   @param author_id [String] The author of the content.
      #
      #   @param channel_key [String] The key of the channel.
      #
      #   @param content_id [String] The unique ID of the content in your database.
      #
      #   @param context_id [String] For example the ID of a chat room or a post
      #
      #   @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      #   @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
