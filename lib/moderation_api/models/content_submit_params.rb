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
      #   @return [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::Object]
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
      #   (Enterprise) override the channel policies for this moderation request only.
      #
      #   @return [Array<ModerationAPI::Models::ContentSubmitParams::Policy::Toxicity, ModerationAPI::Models::ContentSubmitParams::Policy::PersonalInformation, ModerationAPI::Models::ContentSubmitParams::Policy::ToxicitySevere, ModerationAPI::Models::ContentSubmitParams::Policy::Hate, ModerationAPI::Models::ContentSubmitParams::Policy::Illicit, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitDrugs, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitAlcohol, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitFirearms, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitTobacco, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitGambling, ModerationAPI::Models::ContentSubmitParams::Policy::Cannabis, ModerationAPI::Models::ContentSubmitParams::Policy::Adult, ModerationAPI::Models::ContentSubmitParams::Policy::Crypto, ModerationAPI::Models::ContentSubmitParams::Policy::Sexual, ModerationAPI::Models::ContentSubmitParams::Policy::Flirtation, ModerationAPI::Models::ContentSubmitParams::Policy::Profanity, ModerationAPI::Models::ContentSubmitParams::Policy::Violence, ModerationAPI::Models::ContentSubmitParams::Policy::SelfHarm, ModerationAPI::Models::ContentSubmitParams::Policy::Spam, ModerationAPI::Models::ContentSubmitParams::Policy::SelfPromotion, ModerationAPI::Models::ContentSubmitParams::Policy::Political, ModerationAPI::Models::ContentSubmitParams::Policy::Religion, ModerationAPI::Models::ContentSubmitParams::Policy::CodeAbuse, ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking, ModerationAPI::Models::ContentSubmitParams::Policy::Guideline>, nil]
      optional :policies,
               -> { ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::ContentSubmitParams::Policy] }

      # @!attribute timestamp
      #   Unix timestamp (in milliseconds) of when the content was created. Use if content
      #   is not submitted in real-time.
      #
      #   @return [Float, nil]
      optional :timestamp, Float

      # @!method initialize(content:, author_id: nil, channel: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, policies: nil, timestamp: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ContentSubmitParams} for more details.
      #
      #   @param content [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::Object] The content sent for moderation
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
      #   @param policies [Array<ModerationAPI::Models::ContentSubmitParams::Policy::Toxicity, ModerationAPI::Models::ContentSubmitParams::Policy::PersonalInformation, ModerationAPI::Models::ContentSubmitParams::Policy::ToxicitySevere, ModerationAPI::Models::ContentSubmitParams::Policy::Hate, ModerationAPI::Models::ContentSubmitParams::Policy::Illicit, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitDrugs, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitAlcohol, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitFirearms, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitTobacco, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitGambling, ModerationAPI::Models::ContentSubmitParams::Policy::Cannabis, ModerationAPI::Models::ContentSubmitParams::Policy::Adult, ModerationAPI::Models::ContentSubmitParams::Policy::Crypto, ModerationAPI::Models::ContentSubmitParams::Policy::Sexual, ModerationAPI::Models::ContentSubmitParams::Policy::Flirtation, ModerationAPI::Models::ContentSubmitParams::Policy::Profanity, ModerationAPI::Models::ContentSubmitParams::Policy::Violence, ModerationAPI::Models::ContentSubmitParams::Policy::SelfHarm, ModerationAPI::Models::ContentSubmitParams::Policy::Spam, ModerationAPI::Models::ContentSubmitParams::Policy::SelfPromotion, ModerationAPI::Models::ContentSubmitParams::Policy::Political, ModerationAPI::Models::ContentSubmitParams::Policy::Religion, ModerationAPI::Models::ContentSubmitParams::Policy::CodeAbuse, ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking, ModerationAPI::Models::ContentSubmitParams::Policy::Guideline>] (Enterprise) override the channel policies for this moderation request only.
      #
      #   @param timestamp [Float] Unix timestamp (in milliseconds) of when the content was created. Use if content
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
        variant -> { ModerationAPI::ContentSubmitParams::Content::Object }

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

          # @!attribute data
          #   Base64-encoded image data
          #
          #   @return [String, nil]
          optional :data, String

          # @!attribute url
          #   A public URL of the image content
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(data: nil, url: nil, type: :image)
          #   Image
          #
          #   @param data [String] Base64-encoded image data
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

        class Object < ModerationAPI::Internal::Type::BaseModel
          # @!attribute data
          #   Values in the object. Can be mixed content types.
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Audio}]
          required :data,
                   -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::ContentSubmitParams::Content::Object::Data] }

          # @!attribute type
          #
          #   @return [Symbol, :object]
          required :type, const: :object

          # @!method initialize(data:, type: :object)
          #   Object
          #
          #   @param data [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Audio}] Values in the object. Can be mixed content types.
          #
          #   @param type [Symbol, :object]

          # Text
          module Data
            extend ModerationAPI::Internal::Type::Union

            # Text
            variant -> { ModerationAPI::ContentSubmitParams::Content::Object::Data::Text }

            # Image
            variant -> { ModerationAPI::ContentSubmitParams::Content::Object::Data::Image }

            # Video
            variant -> { ModerationAPI::ContentSubmitParams::Content::Object::Data::Video }

            # Audio
            variant -> { ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio }

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

              # @!attribute data
              #   Base64-encoded image data
              #
              #   @return [String, nil]
              optional :data, String

              # @!attribute url
              #   A public URL of the image content
              #
              #   @return [String, nil]
              optional :url, String

              # @!method initialize(data: nil, url: nil, type: :image)
              #   Image
              #
              #   @param data [String] Base64-encoded image data
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
            #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Text, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Image, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Video, ModerationAPI::Models::ContentSubmitParams::Content::Object::Data::Audio)]
          end
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::Object)]
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

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Toxicity }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::PersonalInformation }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Hate }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Illicit }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::IllicitGambling }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Cannabis }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Adult }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Crypto }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Sexual }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Flirtation }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Profanity }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Violence }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::SelfHarm }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Spam }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::SelfPromotion }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Political }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Religion }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::CodeAbuse }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::PiiMasking }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::URLMasking }

        variant -> { ModerationAPI::ContentSubmitParams::Policy::Guideline }

        class Toxicity < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :toxicity]
          required :id, const: :toxicity

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :toxicity)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :toxicity]
        end

        class PersonalInformation < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :personal_information]
          required :id, const: :personal_information

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :personal_information)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :personal_information]
        end

        class ToxicitySevere < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :toxicity_severe]
          required :id, const: :toxicity_severe

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :toxicity_severe)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :toxicity_severe]
        end

        class Hate < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :hate]
          required :id, const: :hate

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :hate)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :hate]
        end

        class Illicit < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit]
          required :id, const: :illicit

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit]
        end

        class IllicitDrugs < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_drugs]
          required :id, const: :illicit_drugs

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit_drugs)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit_drugs]
        end

        class IllicitAlcohol < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_alcohol]
          required :id, const: :illicit_alcohol

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit_alcohol)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit_alcohol]
        end

        class IllicitFirearms < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_firearms]
          required :id, const: :illicit_firearms

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit_firearms)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit_firearms]
        end

        class IllicitTobacco < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_tobacco]
          required :id, const: :illicit_tobacco

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit_tobacco)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit_tobacco]
        end

        class IllicitGambling < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :illicit_gambling]
          required :id, const: :illicit_gambling

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :illicit_gambling)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :illicit_gambling]
        end

        class Cannabis < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :cannabis]
          required :id, const: :cannabis

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :cannabis)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :cannabis]
        end

        class Adult < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :adult]
          required :id, const: :adult

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :adult)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :adult]
        end

        class Crypto < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :crypto]
          required :id, const: :crypto

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :crypto)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :crypto]
        end

        class Sexual < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :sexual]
          required :id, const: :sexual

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :sexual)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :sexual]
        end

        class Flirtation < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :flirtation]
          required :id, const: :flirtation

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :flirtation)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :flirtation]
        end

        class Profanity < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :profanity]
          required :id, const: :profanity

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :profanity)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :profanity]
        end

        class Violence < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :violence]
          required :id, const: :violence

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :violence)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :violence]
        end

        class SelfHarm < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :self_harm]
          required :id, const: :self_harm

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :self_harm)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :self_harm]
        end

        class Spam < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :spam]
          required :id, const: :spam

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :spam)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :spam]
        end

        class SelfPromotion < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :self_promotion]
          required :id, const: :self_promotion

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :self_promotion)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :self_promotion]
        end

        class Political < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :political]
          required :id, const: :political

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :political)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :political]
        end

        class Religion < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :religion]
          required :id, const: :religion

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :religion)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :religion]
        end

        class CodeAbuse < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :code_abuse]
          required :id, const: :code_abuse

          # @!attribute flag
          #
          #   @return [Boolean]
          required :flag, ModerationAPI::Internal::Type::Boolean

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, threshold: nil, id: :code_abuse)
          #   @param flag [Boolean]
          #   @param threshold [Float]
          #   @param id [Symbol, :code_abuse]
        end

        class PiiMasking < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :pii]
          required :id, const: :pii

          # @!attribute entities
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking::Entity}]
          required :entities,
                   -> { ModerationAPI::Internal::Type::HashOf[ModerationAPI::ContentSubmitParams::Policy::PiiMasking::Entity] }

          # @!method initialize(entities:, id: :pii)
          #   @param entities [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking::Entity}]
          #   @param id [Symbol, :pii]

          class Entity < ModerationAPI::Internal::Type::BaseModel
            # @!attribute enable
            #
            #   @return [Boolean, nil]
            optional :enable, ModerationAPI::Internal::Type::Boolean

            # @!attribute flag
            #
            #   @return [Boolean, nil]
            optional :flag, ModerationAPI::Internal::Type::Boolean

            # @!attribute mask
            #
            #   @return [String, nil]
            optional :mask, String

            # @!attribute should_mask
            #
            #   @return [Boolean, nil]
            optional :should_mask, ModerationAPI::Internal::Type::Boolean, api_name: :shouldMask

            # @!method initialize(enable: nil, flag: nil, mask: nil, should_mask: nil)
            #   @param enable [Boolean]
            #   @param flag [Boolean]
            #   @param mask [String]
            #   @param should_mask [Boolean]
          end
        end

        class URLMasking < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :url]
          required :id, const: :url

          # @!attribute entities
          #
          #   @return [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking::Entity}]
          required :entities,
                   -> { ModerationAPI::Internal::Type::HashOf[ModerationAPI::ContentSubmitParams::Policy::URLMasking::Entity] }

          # @!method initialize(entities:, id: :url)
          #   @param entities [Hash{Symbol=>ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking::Entity}]
          #   @param id [Symbol, :url]

          class Entity < ModerationAPI::Internal::Type::BaseModel
            # @!attribute enable
            #
            #   @return [Boolean, nil]
            optional :enable, ModerationAPI::Internal::Type::Boolean

            # @!attribute flag
            #
            #   @return [Boolean, nil]
            optional :flag, ModerationAPI::Internal::Type::Boolean

            # @!attribute mask
            #
            #   @return [String, nil]
            optional :mask, String

            # @!attribute should_mask
            #
            #   @return [Boolean, nil]
            optional :should_mask, ModerationAPI::Internal::Type::Boolean, api_name: :shouldMask

            # @!method initialize(enable: nil, flag: nil, mask: nil, should_mask: nil)
            #   @param enable [Boolean]
            #   @param flag [Boolean]
            #   @param mask [String]
            #   @param should_mask [Boolean]
          end
        end

        class Guideline < ModerationAPI::Internal::Type::BaseModel
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

          # @!attribute threshold
          #
          #   @return [Float, nil]
          optional :threshold, Float

          # @!method initialize(flag:, guideline_key:, instructions:, threshold: nil, id: :guideline)
          #   @param flag [Boolean]
          #   @param guideline_key [String]
          #   @param instructions [String]
          #   @param threshold [Float]
          #   @param id [Symbol, :guideline]
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitParams::Policy::Toxicity, ModerationAPI::Models::ContentSubmitParams::Policy::PersonalInformation, ModerationAPI::Models::ContentSubmitParams::Policy::ToxicitySevere, ModerationAPI::Models::ContentSubmitParams::Policy::Hate, ModerationAPI::Models::ContentSubmitParams::Policy::Illicit, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitDrugs, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitAlcohol, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitFirearms, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitTobacco, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitGambling, ModerationAPI::Models::ContentSubmitParams::Policy::Cannabis, ModerationAPI::Models::ContentSubmitParams::Policy::Adult, ModerationAPI::Models::ContentSubmitParams::Policy::Crypto, ModerationAPI::Models::ContentSubmitParams::Policy::Sexual, ModerationAPI::Models::ContentSubmitParams::Policy::Flirtation, ModerationAPI::Models::ContentSubmitParams::Policy::Profanity, ModerationAPI::Models::ContentSubmitParams::Policy::Violence, ModerationAPI::Models::ContentSubmitParams::Policy::SelfHarm, ModerationAPI::Models::ContentSubmitParams::Policy::Spam, ModerationAPI::Models::ContentSubmitParams::Policy::SelfPromotion, ModerationAPI::Models::ContentSubmitParams::Policy::Political, ModerationAPI::Models::ContentSubmitParams::Policy::Religion, ModerationAPI::Models::ContentSubmitParams::Policy::CodeAbuse, ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking, ModerationAPI::Models::ContentSubmitParams::Policy::Guideline)]
      end
    end
  end
end
