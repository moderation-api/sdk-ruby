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
      #   @return [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode]
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

      # @!attribute policies
      #   Optionally override the channel policies for this moderation request only
      #   (enterprise).
      #
      #   @return [Array<ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember4, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember5, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember6, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember7, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember8, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember9, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember10, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember11, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember12, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember13, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember14, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember15, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember16, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember17, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember18, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember19, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember22>, nil]
      optional :policies,
               -> { ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::ContentSubmitParams::Policy] }

      # @!method initialize(content:, author_id: nil, channel: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, policies: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ContentSubmitParams} for more details.
      #
      #   @param content [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode] The content sent for moderation
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
      #   @param policies [Array<ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember4, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember5, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember6, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember7, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember8, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember9, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember10, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember11, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember12, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember13, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember14, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember15, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember16, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember17, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember18, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember19, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember22>] Optionally override the channel policies for this moderation request only (enter
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      # The content sent for moderation
      module Content
        extend ModerationAPI::Internal::Type::Union

        # Text
        variant -> { ModerationAPI::ContentSubmitParams::Content::Text }

        # Image
        variant -> { ModerationAPI::ContentSubmitParams::Content::Image }

        # Video
        variant -> { ModerationAPI::ContentSubmitParams::Content::Video }

        # Audio
        variant -> { ModerationAPI::ContentSubmitParams::Content::Audio }

        # Object
        variant -> { ModerationAPI::ContentSubmitParams::Content::ContentNode }

        class Text < ModerationAPI::Internal::Type::BaseModel
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

        class Image < ModerationAPI::Internal::Type::BaseModel
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

        class Video < ModerationAPI::Internal::Type::BaseModel
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

        class Audio < ModerationAPI::Internal::Type::BaseModel
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

        class ContentNode < ModerationAPI::Internal::Type::BaseModel
          # @!attribute data
          #   Values in the object. Can be mixed content types.
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Audio}]
          required :data,
                   -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::ContentSubmitParams::Content::ContentNode::Data] }

          # @!attribute type
          #
          #   @return [Symbol, :object]
          required :type, const: :object

          # @!method initialize(data:, type: :object)
          #   Object
          #
          #   @param data [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Audio}] Values in the object. Can be mixed content types.
          #
          #   @param type [Symbol, :object]

          # Text
          module Data
            extend ModerationAPI::Internal::Type::Union

            # Text
            variant -> { ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text }

            # Image
            variant -> { ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image }

            # Video
            variant -> { ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video }

            # Audio
            variant -> { ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio }

            class Text < ModerationAPI::Internal::Type::BaseModel
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

            class Image < ModerationAPI::Internal::Type::BaseModel
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

            class Video < ModerationAPI::Internal::Type::BaseModel
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

            class Audio < ModerationAPI::Internal::Type::BaseModel
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
            #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode::Data::Audio)]
          end
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::ContentNode)]
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

      module Policy
        extend ModerationAPI::Internal::Type::Union

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember0 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember1 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember2 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember3 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember4 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember5 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember6 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember7 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember8 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember9 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember10 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember11 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember12 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember13 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember14 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember15 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember16 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember17 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember18 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember19 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember20 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember21 }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember22 }

        class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :toxicity]
          required :id, const: :toxicity

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :toxicity)
          #   @param flag [Boolean]
          #   @param id [Symbol, :toxicity]
        end

        class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :personal_information]
          required :id, const: :personal_information

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :personal_information)
          #   @param flag [Boolean]
          #   @param id [Symbol, :personal_information]
        end

        class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :toxicity_severe]
          required :id, const: :toxicity_severe

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :toxicity_severe)
          #   @param flag [Boolean]
          #   @param id [Symbol, :toxicity_severe]
        end

        class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :hate]
          required :id, const: :hate

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :hate)
          #   @param flag [Boolean]
          #   @param id [Symbol, :hate]
        end

        class UnionMember4 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit]
          required :id, const: :illicit

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit]
        end

        class UnionMember5 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_drugs]
          required :id, const: :illicit_drugs

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit_drugs)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit_drugs]
        end

        class UnionMember6 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_alcohol]
          required :id, const: :illicit_alcohol

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit_alcohol)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit_alcohol]
        end

        class UnionMember7 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_firearms]
          required :id, const: :illicit_firearms

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit_firearms)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit_firearms]
        end

        class UnionMember8 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_tobacco]
          required :id, const: :illicit_tobacco

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit_tobacco)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit_tobacco]
        end

        class UnionMember9 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_gambling]
          required :id, const: :illicit_gambling

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :illicit_gambling)
          #   @param flag [Boolean]
          #   @param id [Symbol, :illicit_gambling]
        end

        class UnionMember10 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :sexual]
          required :id, const: :sexual

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :sexual)
          #   @param flag [Boolean]
          #   @param id [Symbol, :sexual]
        end

        class UnionMember11 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :flirtation]
          required :id, const: :flirtation

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :flirtation)
          #   @param flag [Boolean]
          #   @param id [Symbol, :flirtation]
        end

        class UnionMember12 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :profanity]
          required :id, const: :profanity

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :profanity)
          #   @param flag [Boolean]
          #   @param id [Symbol, :profanity]
        end

        class UnionMember13 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :violence]
          required :id, const: :violence

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :violence)
          #   @param flag [Boolean]
          #   @param id [Symbol, :violence]
        end

        class UnionMember14 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :self_harm]
          required :id, const: :self_harm

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :self_harm)
          #   @param flag [Boolean]
          #   @param id [Symbol, :self_harm]
        end

        class UnionMember15 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :spam]
          required :id, const: :spam

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :spam)
          #   @param flag [Boolean]
          #   @param id [Symbol, :spam]
        end

        class UnionMember16 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :self_promotion]
          required :id, const: :self_promotion

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :self_promotion)
          #   @param flag [Boolean]
          #   @param id [Symbol, :self_promotion]
        end

        class UnionMember17 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :political]
          required :id, const: :political

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :political)
          #   @param flag [Boolean]
          #   @param id [Symbol, :political]
        end

        class UnionMember18 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :religion]
          required :id, const: :religion

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :religion)
          #   @param flag [Boolean]
          #   @param id [Symbol, :religion]
        end

        class UnionMember19 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :code_abuse]
          required :id, const: :code_abuse

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(flag:, id: :code_abuse)
          #   @param flag [Boolean]
          #   @param id [Symbol, :code_abuse]
        end

        class UnionMember20 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :pii]
          required :id, const: :pii

          # @!attribute entities
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20::Entity}]
          required :entities,
                   -> { ModerationAPI::Internal::Type::HashOf[ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity] }

          # @!method initialize(entities:, id: :pii)
          #   @param entities [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20::Entity}]
          #   @param id [Symbol, :pii]

          class Entity < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [Symbol, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20::Entity::ID]
            required :id, enum: -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID }

            # @!attribute enable
            #
            #   @return [Boolean]
            required :enable, ModerationAPI::Internal::Type::Boolean

            # @!attribute flag
            #
            #   @return [Boolean]
            required :flag, ModerationAPI::Internal::Type::Boolean

            # @!attribute should_mask
            #
            #   @return [Boolean]
            required :should_mask, ModerationAPI::Internal::Type::Boolean, api_name: :shouldMask

            # @!attribute mask
            #
            #   @return [String, nil]
            optional :mask, String

            # @!method initialize(id:, enable:, flag:, should_mask:, mask: nil)
            #   @param id [Symbol, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20::Entity::ID]
            #   @param enable [Boolean]
            #   @param flag [Boolean]
            #   @param should_mask [Boolean]
            #   @param mask [String]

            # @see ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20::Entity#id
            module ID
              extend ModerationAPI::Internal::Type::Enum

              EMAIL = :email
              PHONE = :phone
              URL = :url
              ADDRESS = :address
              NAME = :name
              USERNAME = :username
              IP_ADDRESS = :ip_address
              CREDIT_CARD = :credit_card
              SENSITIVE_OTHER = :sensitive_other

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        class UnionMember21 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :url]
          required :id, const: :url

          # @!attribute entities
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21::Entity}]
          required :entities,
                   -> { ModerationAPI::Internal::Type::HashOf[ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity] }

          # @!method initialize(entities:, id: :url)
          #   @param entities [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21::Entity}]
          #   @param id [Symbol, :url]

          class Entity < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [Symbol, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21::Entity::ID]
            required :id, enum: -> { ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID }

            # @!attribute enable
            #
            #   @return [Boolean]
            required :enable, ModerationAPI::Internal::Type::Boolean

            # @!attribute flag
            #
            #   @return [Boolean]
            required :flag, ModerationAPI::Internal::Type::Boolean

            # @!attribute should_mask
            #
            #   @return [Boolean]
            required :should_mask, ModerationAPI::Internal::Type::Boolean, api_name: :shouldMask

            # @!attribute mask
            #
            #   @return [String, nil]
            optional :mask, String

            # @!method initialize(id:, enable:, flag:, should_mask:, mask: nil)
            #   @param id [Symbol, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21::Entity::ID]
            #   @param enable [Boolean]
            #   @param flag [Boolean]
            #   @param should_mask [Boolean]
            #   @param mask [String]

            # @see ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21::Entity#id
            module ID
              extend ModerationAPI::Internal::Type::Enum

              EMAIL = :email
              PHONE = :phone
              URL = :url
              ADDRESS = :address
              NAME = :name
              USERNAME = :username
              IP_ADDRESS = :ip_address
              CREDIT_CARD = :credit_card
              SENSITIVE_OTHER = :sensitive_other

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        class UnionMember22 < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :guideline]
          required :id, const: :guideline

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute guideline_key
          #
          #   @return [String]
          required :guideline_key, String, api_name: :guidelineKey

          # @!attribute instructions
          #
          #   @return [String]
          required :instructions, String

          # @!method initialize(flag:, guideline_key:, instructions:, id: :guideline)
          #   @param flag [Boolean]
          #   @param guideline_key [String]
          #   @param instructions [String]
          #   @param id [Symbol, :guideline]
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember0, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember1, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember2, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember3, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember4, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember5, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember6, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember7, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember8, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember9, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember10, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember11, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember12, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember13, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember14, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember15, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember16, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember17, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember18, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember19, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember20, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember21, ModerationAPI::Models::ContentSubmitParams::Policy::UnionMember22)]
      end
    end
  end
end
