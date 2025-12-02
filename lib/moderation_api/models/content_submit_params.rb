# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Content#submit
    class ContentSubmitParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute content
      #   The content sent for moderation
      #
      #   @return [ModerationAPI::Models::ContentSubmitParams::Content::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4]
      required :content, union: -> { ModerationAPI::ContentSubmitParams::Content }

      # @!attribute author_id
      #   The author of the content.
      #
      #   @return [String, nil]
      optional :author_id, String, api_name: :authorId

      # @!attribute channel
      #   Provide a channel ID or key. Will use the project's default channel if not
      #   provided.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute content_id
      #   The unique ID of the content in your database.
      #
      #   @return [String, nil]
      optional :content_id, String, api_name: :contentId

      # @!attribute conversation_id
      #   For example the ID of a chat room or a post
      #
      #   @return [String, nil]
      optional :conversation_id, String, api_name: :conversationId

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

      # @!attribute meta_type
      #   The meta type of content being moderated
      #
      #   @return [Symbol, ModerationAPI::Models::ContentSubmitParams::MetaType, nil]
      optional :meta_type, enum: -> { ModerationAPI::ContentSubmitParams::MetaType }, api_name: :metaType

      # @!method initialize(content:, author_id: nil, channel: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ContentSubmitParams} for more details.
      #
      #   @param content [ModerationAPI::Models::ContentSubmitParams::Content::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4] The content sent for moderation
      #
      #   @param author_id [String] The author of the content.
      #
      #   @param channel [String] Provide a channel ID or key. Will use the project's default channel if not provi
      #
      #   @param content_id [String] The unique ID of the content in your database.
      #
      #   @param conversation_id [String] For example the ID of a chat room or a post
      #
      #   @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      #   @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      #   @param meta_type [Symbol, ModerationAPI::Models::ContentSubmitParams::MetaType] The meta type of content being moderated
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      # The content sent for moderation
      module Content
        extend ModerationAPI::Internal::Type::Union

        # Text
        variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember0 }

        # Image
        variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember1 }

        # Video
        variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember2 }

        # Audio
        variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember3 }

        # Object
        variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember4 }

        class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute text
          #   The content text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, :text]
          required :type, const: :text

          # @!method initialize(text:, type: :text)
          #   Text
          #
          #   @param text [String] The content text
          #
          #   @param type [Symbol, :text]
        end

        class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :image]
          required :type, const: :image

          # @!attribute url
          #   A public URL of the image content
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:, type: :image)
          #   Image
          #
          #   @param url [String] A public URL of the image content
          #
          #   @param type [Symbol, :image]
        end

        class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :video]
          required :type, const: :video

          # @!attribute url
          #   A public URL of the video content
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:, type: :video)
          #   Video
          #
          #   @param url [String] A public URL of the video content
          #
          #   @param type [Symbol, :video]
        end

        class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :audio]
          required :type, const: :audio

          # @!attribute url
          #   The URL of the audio content
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:, type: :audio)
          #   Audio
          #
          #   @param url [String] The URL of the audio content
          #
          #   @param type [Symbol, :audio]
        end

        class UnionMember4 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute data
          #   Values in the object. Can be mixed content types.
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember3}]
          required :data,
                   -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::ContentSubmitParams::Content::UnionMember4::Data] }

          # @!attribute type
          #
          #   @return [Symbol, :object]
          required :type, const: :object

          # @!method initialize(data:, type: :object)
          #   Object
          #
          #   @param data [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember3}] Values in the object. Can be mixed content types.
          #
          #   @param type [Symbol, :object]

          # Text
          module Data
            extend ModerationAPI::Internal::Type::Union

            # Text
            variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember4::Data::UnionMember0 }

            # Image
            variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember4::Data::UnionMember1 }

            # Video
            variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember4::Data::UnionMember2 }

            # Audio
            variant -> { ModerationAPI::ContentSubmitParams::Content::UnionMember4::Data::UnionMember3 }

            class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
              # @!attribute text
              #   The content text
              #
              #   @return [String]
              required :text, String

              # @!attribute type
              #
              #   @return [Symbol, :text]
              required :type, const: :text

              # @!method initialize(text:, type: :text)
              #   Text
              #
              #   @param text [String] The content text
              #
              #   @param type [Symbol, :text]
            end

            class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :image]
              required :type, const: :image

              # @!attribute url
              #   A public URL of the image content
              #
              #   @return [String]
              required :url, String

              # @!method initialize(url:, type: :image)
              #   Image
              #
              #   @param url [String] A public URL of the image content
              #
              #   @param type [Symbol, :image]
            end

            class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :video]
              required :type, const: :video

              # @!attribute url
              #   A public URL of the video content
              #
              #   @return [String]
              required :url, String

              # @!method initialize(url:, type: :video)
              #   Video
              #
              #   @param url [String] A public URL of the video content
              #
              #   @param type [Symbol, :video]
            end

            class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :audio]
              required :type, const: :audio

              # @!attribute url
              #   The URL of the audio content
              #
              #   @return [String]
              required :url, String

              # @!method initialize(url:, type: :audio)
              #   Audio
              #
              #   @param url [String] The URL of the audio content
              #
              #   @param type [Symbol, :audio]
            end

            # @!method self.variants
            #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4::Data::UnionMember3)]
          end
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Content::UnionMember4)]
      end

      # The meta type of content being moderated
      module MetaType
        extend ModerationAPI::Internal::Type::Enum

        PROFILE = :profile
        MESSAGE = :message
        POST = :post
        COMMENT = :comment
        EVENT = :event
        PRODUCT = :product
        REVIEW = :review
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
