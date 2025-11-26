# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Moderate#analyze_object
    class ModerateAnalyzeObjectParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute value
      #   The object you want to analyze.
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeObjectParams::Value]
      required :value, -> { ModerationAPI::ModerateAnalyzeObjectParams::Value }

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

      # @!method initialize(value:, author_id: nil, channel_key: nil, content_id: nil, context_id: nil, do_not_store: nil, metadata: nil, request_options: {})
      #   @param value [ModerationAPI::Models::ModerateAnalyzeObjectParams::Value] The object you want to analyze.
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

      class Value < ModerationAPI::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Hash{Symbol=>ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Data}]
        required :data,
                 -> { ModerationAPI::Internal::Type::HashOf[ModerationAPI::ModerateAnalyzeObjectParams::Value::Data] }

        # @!attribute type
        #   The type of the object you want to analyze.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Type]
        required :type, enum: -> { ModerationAPI::ModerateAnalyzeObjectParams::Value::Type }

        # @!method initialize(data:, type:)
        #   The object you want to analyze.
        #
        #   @param data [Hash{Symbol=>ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Data}]
        #
        #   @param type [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Type] The type of the object you want to analyze.

        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute type
          #   The type of content (e.g., "text", "image", "video")
          #
          #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Data::Type]
          required :type, enum: -> { ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type }

          # @!attribute value
          #   The content to analyze
          #
          #   @return [String]
          required :value, String

          # @!attribute model_ids
          #   Optional array of specific model IDs to use
          #
          #   @return [Array<String>, nil]
          optional :model_ids, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :modelIds

          # @!method initialize(type:, value:, model_ids: nil)
          #   @param type [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Data::Type] The type of content (e.g., "text", "image", "video")
          #
          #   @param value [String] The content to analyze
          #
          #   @param model_ids [Array<String>] Optional array of specific model IDs to use

          # The type of content (e.g., "text", "image", "video")
          #
          # @see ModerationAPI::Models::ModerateAnalyzeObjectParams::Value::Data#type
          module Type
            extend ModerationAPI::Internal::Type::Enum

            TEXT = :text
            IMAGE = :image
            VIDEO = :video
            AUDIO = :audio

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The type of the object you want to analyze.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeObjectParams::Value#type
        module Type
          extend ModerationAPI::Internal::Type::Enum

          PROFILE = :profile
          EVENT = :event
          PRODUCT = :product
          OBJECT = :object

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
