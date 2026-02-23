# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Content#submit
    class ContentSubmitResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute author
      #   The author of the content if your account has authors enabled. Requires you to
      #   send authorId when submitting content.
      #
      #   @return [ModerationAPI::Models::ContentSubmitResponse::Author, nil]
      required :author, -> { ModerationAPI::Models::ContentSubmitResponse::Author }, nil?: true

      # @!attribute content
      #   Potentially modified content.
      #
      #   @return [ModerationAPI::Models::ContentSubmitResponse::Content]
      required :content, -> { ModerationAPI::Models::ContentSubmitResponse::Content }

      # @!attribute evaluation
      #   The evaluation of the content after running the channel policies.
      #
      #   @return [ModerationAPI::Models::ContentSubmitResponse::Evaluation]
      required :evaluation, -> { ModerationAPI::Models::ContentSubmitResponse::Evaluation }

      # @!attribute insights
      #   Results of all insights enabled in the channel.
      #
      #   @return [Array<ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight, ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight>]
      required :insights,
               -> { ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ContentSubmitResponse::Insight] }

      # @!attribute meta
      #   Metadata about the moderation request
      #
      #   @return [ModerationAPI::Models::ContentSubmitResponse::Meta]
      required :meta, -> { ModerationAPI::Models::ContentSubmitResponse::Meta }

      # @!attribute policies
      #   Results of all policies in the channel. Sorted by highest probability.
      #
      #   @return [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput, ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput>]
      required :policies,
               -> { ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ContentSubmitResponse::Policy] }

      # @!attribute recommendation
      #   The recommendation for the content based on the evaluation.
      #
      #   @return [ModerationAPI::Models::ContentSubmitResponse::Recommendation]
      required :recommendation, -> { ModerationAPI::Models::ContentSubmitResponse::Recommendation }

      # @!attribute errors
      #   Policies that had errors
      #
      #   @return [Array<ModerationAPI::Models::ContentSubmitResponse::Error>, nil]
      optional :errors,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ContentSubmitResponse::Error] }

      # @!method initialize(author:, content:, evaluation:, insights:, meta:, policies:, recommendation:, errors: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ContentSubmitResponse} for more details.
      #
      #   @param author [ModerationAPI::Models::ContentSubmitResponse::Author, nil] The author of the content if your account has authors enabled. Requires you to s
      #
      #   @param content [ModerationAPI::Models::ContentSubmitResponse::Content] Potentially modified content.
      #
      #   @param evaluation [ModerationAPI::Models::ContentSubmitResponse::Evaluation] The evaluation of the content after running the channel policies.
      #
      #   @param insights [Array<ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight, ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight>] Results of all insights enabled in the channel.
      #
      #   @param meta [ModerationAPI::Models::ContentSubmitResponse::Meta] Metadata about the moderation request
      #
      #   @param policies [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput, ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput>] Results of all policies in the channel. Sorted by highest probability.
      #
      #   @param recommendation [ModerationAPI::Models::ContentSubmitResponse::Recommendation] The recommendation for the content based on the evaluation.
      #
      #   @param errors [Array<ModerationAPI::Models::ContentSubmitResponse::Error>] Policies that had errors

      # @see ModerationAPI::Models::ContentSubmitResponse#author
      class Author < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Author ID in Moderation API
        #
        #   @return [String]
        required :id, String

        # @!attribute block
        #   Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @return [ModerationAPI::Models::ContentSubmitResponse::Author::Block, nil]
        required :block, -> { ModerationAPI::Models::ContentSubmitResponse::Author::Block }, nil?: true

        # @!attribute status
        #   Current author status
        #
        #   @return [Symbol, ModerationAPI::Models::ContentSubmitResponse::Author::Status]
        required :status, enum: -> { ModerationAPI::Models::ContentSubmitResponse::Author::Status }

        # @!attribute trust_level
        #
        #   @return [ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel]
        required :trust_level, -> { ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel }

        # @!attribute external_id
        #   The author's ID from your system
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!method initialize(id:, block:, status:, trust_level:, external_id: nil)
        #   The author of the content if your account has authors enabled. Requires you to
        #   send authorId when submitting content.
        #
        #   @param id [String] Author ID in Moderation API
        #
        #   @param block [ModerationAPI::Models::ContentSubmitResponse::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @param status [Symbol, ModerationAPI::Models::ContentSubmitResponse::Author::Status] Current author status
        #
        #   @param trust_level [ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel]
        #
        #   @param external_id [String, nil] The author's ID from your system

        # @see ModerationAPI::Models::ContentSubmitResponse::Author#block
        class Block < ModerationAPI::Internal::Type::BaseModel
          # @!attribute reason
          #   The moderators reason why the author was blocked or suspended.
          #
          #   @return [String, nil]
          optional :reason, String, nil?: true

          # @!attribute until_
          #   The timestamp until which they are blocked if the author is suspended.
          #
          #   @return [Float, nil]
          optional :until_, Float, api_name: :until, nil?: true

          # @!method initialize(reason: nil, until_: nil)
          #   Block or suspension details, if applicable. Null if the author is enabled.
          #
          #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
          #
          #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
        end

        # Current author status
        #
        # @see ModerationAPI::Models::ContentSubmitResponse::Author#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          ENABLED = :enabled
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ModerationAPI::Models::ContentSubmitResponse::Author#trust_level
        class TrustLevel < ModerationAPI::Internal::Type::BaseModel
          # @!attribute level
          #   Author trust level (-1, 0, 1, 2, 3, or 4)
          #
          #   @return [Float]
          required :level, Float

          # @!attribute manual
          #   True if the trust level was set manually by a moderator
          #
          #   @return [Boolean]
          required :manual, ModerationAPI::Internal::Type::Boolean

          # @!method initialize(level:, manual:)
          #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
          #
          #   @param manual [Boolean] True if the trust level was set manually by a moderator
        end
      end

      # @see ModerationAPI::Models::ContentSubmitResponse#content
      class Content < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the content. Either the contentId provided by you or
        #   an autogenerated ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute masked
        #   Whether any values have been masked.
        #
        #   @return [Boolean]
        required :masked, ModerationAPI::Internal::Type::Boolean

        # @!attribute modified
        #   The modified content, if any.
        #
        #   @return [String, Hash{Symbol=>Object}, Hash{Symbol=>ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Text, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Video, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Audio}, nil]
        required :modified,
                 union: -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified },
                 nil?: true

        # @!method initialize(id:, masked:, modified:)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ContentSubmitResponse::Content} for more details.
        #
        #   Potentially modified content.
        #
        #   @param id [String] The unique identifier for the content. Either the contentId provided by you or a
        #
        #   @param masked [Boolean] Whether any values have been masked.
        #
        #   @param modified [String, Hash{Symbol=>Object}, Hash{Symbol=>ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Text, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Video, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Audio}, nil] The modified content, if any.

        # The modified content, if any.
        #
        # @see ModerationAPI::Models::ContentSubmitResponse::Content#modified
        module Modified
          extend ModerationAPI::Internal::Type::Union

          variant String

          variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedObjectContentMap }

          variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContentMap }

          # Text
          module ModifiedNestedObjectContent
            extend ModerationAPI::Internal::Type::Union

            # Text
            variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Text }

            # Image
            variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image }

            # Video
            variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Video }

            # Audio
            variant -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Audio }

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
              #   Base64-encoded image data. Either url or data must be provided. Note: base64
              #   images are not stored and will not appear in the review queue.
              #
              #   @return [String, nil]
              optional :data, String

              # @!attribute url
              #   A public URL of the image content. Either url or data must be provided.
              #
              #   @return [String, nil]
              optional :url, String

              # @!method initialize(data: nil, url: nil, type: :image)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image}
              #   for more details.
              #
              #   Image
              #
              #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
              #
              #   @param url [String] A public URL of the image content. Either url or data must be provided.
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
            #   @return [Array(ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Text, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Video, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Audio)]
          end

          # @!method self.variants
          #   @return [Array(String, Hash{Symbol=>Object}, Hash{Symbol=>ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Text, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Image, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Video, ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent::Audio})]

          # @type [ModerationAPI::Internal::Type::Converter]
          ModifiedObjectContentMap = ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown]

          # @type [ModerationAPI::Internal::Type::Converter]
          ModifiedNestedObjectContentMap =
            ModerationAPI::Internal::Type::HashOf[union: -> { ModerationAPI::Models::ContentSubmitResponse::Content::Modified::ModifiedNestedObjectContent }]
        end
      end

      # @see ModerationAPI::Models::ContentSubmitResponse#evaluation
      class Evaluation < ModerationAPI::Internal::Type::BaseModel
        # @!attribute flag_probability
        #   The probability that the content should be flagged.
        #
        #   @return [Float]
        required :flag_probability, Float

        # @!attribute flagged
        #   Whether the content was flagged by any policy.
        #
        #   @return [Boolean]
        required :flagged, ModerationAPI::Internal::Type::Boolean

        # @!attribute severity_score
        #   The severity score of the content. A higher score indicates more severe content.
        #
        #   @return [Float]
        required :severity_score, Float

        # @!attribute unicode_spoofed
        #   Whether the content was flagged for Unicode spoofing.
        #
        #   @return [Boolean, nil]
        optional :unicode_spoofed, ModerationAPI::Internal::Type::Boolean

        # @!method initialize(flag_probability:, flagged:, severity_score:, unicode_spoofed: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ContentSubmitResponse::Evaluation} for more details.
        #
        #   The evaluation of the content after running the channel policies.
        #
        #   @param flag_probability [Float] The probability that the content should be flagged.
        #
        #   @param flagged [Boolean] Whether the content was flagged by any policy.
        #
        #   @param severity_score [Float] The severity score of the content. A higher score indicates more severe content.
        #
        #   @param unicode_spoofed [Boolean] Whether the content was flagged for Unicode spoofing.
      end

      # Sentiment insight
      module Insight
        extend ModerationAPI::Internal::Type::Union

        # Sentiment insight
        variant -> { ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight }

        # Language insight
        variant -> { ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight }

        class SentimentInsight < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :sentiment]
          required :id, const: :sentiment

          # @!attribute probability
          #
          #   @return [Float]
          required :probability, Float

          # @!attribute type
          #
          #   @return [Symbol, :insight]
          required :type, const: :insight

          # @!attribute value
          #
          #   @return [Symbol, ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value, nil]
          required :value,
                   enum: -> { ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value },
                   nil?: true

          # @!method initialize(probability:, value:, id: :sentiment, type: :insight)
          #   Sentiment insight
          #
          #   @param probability [Float]
          #   @param value [Symbol, ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value, nil]
          #   @param id [Symbol, :sentiment]
          #   @param type [Symbol, :insight]

          # @see ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight#value
          module Value
            extend ModerationAPI::Internal::Type::Enum

            POSITIVE = :positive
            NEUTRAL = :neutral
            NEGATIVE = :negative

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class LanguageInsight < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [Symbol, :language]
          required :id, const: :language

          # @!attribute probability
          #
          #   @return [Float]
          required :probability, Float

          # @!attribute type
          #
          #   @return [Symbol, :insight]
          required :type, const: :insight

          # @!attribute value
          #
          #   @return [String, nil]
          required :value, String, nil?: true

          # @!method initialize(probability:, value:, id: :language, type: :insight)
          #   Language insight
          #
          #   @param probability [Float]
          #   @param value [String, nil]
          #   @param id [Symbol, :language]
          #   @param type [Symbol, :insight]
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight, ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight)]
      end

      # @see ModerationAPI::Models::ContentSubmitResponse#meta
      class Meta < ModerationAPI::Internal::Type::BaseModel
        # @!attribute channel_key
        #   The unique key of the channel where the content was handled. Either the channel
        #   provided by you or automatically routed.
        #
        #   @return [String]
        required :channel_key, String

        # @!attribute status
        #
        #   @return [Symbol, ModerationAPI::Models::ContentSubmitResponse::Meta::Status]
        required :status, enum: -> { ModerationAPI::Models::ContentSubmitResponse::Meta::Status }

        # @!attribute timestamp
        #
        #   @return [Float]
        required :timestamp, Float

        # @!attribute usage
        #
        #   @return [Float]
        required :usage, Float

        # @!attribute processing_time
        #
        #   @return [String, nil]
        optional :processing_time, String

        # @!method initialize(channel_key:, status:, timestamp:, usage:, processing_time: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ContentSubmitResponse::Meta} for more details.
        #
        #   Metadata about the moderation request
        #
        #   @param channel_key [String] The unique key of the channel where the content was handled. Either the channel
        #
        #   @param status [Symbol, ModerationAPI::Models::ContentSubmitResponse::Meta::Status]
        #
        #   @param timestamp [Float]
        #
        #   @param usage [Float]
        #
        #   @param processing_time [String]

        # @see ModerationAPI::Models::ContentSubmitResponse::Meta#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          SUCCESS = :success
          PARTIAL_SUCCESS = :partial_success

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Policy output schema.
      module Policy
        extend ModerationAPI::Internal::Type::Union

        # Classifier policy.
        variant -> { ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput }

        # Entity matcher policy.
        variant -> { ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput }

        class ClassifierOutput < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #   The unique identifier for the classifier output.
          #
          #   @return [String]
          required :id, String

          # @!attribute flagged
          #
          #   @return [Boolean]
          required :flagged, ModerationAPI::Internal::Type::Boolean

          # @!attribute probability
          #
          #   @return [Float]
          required :probability, Float

          # @!attribute type
          #
          #   @return [Symbol, :classifier]
          required :type, const: :classifier

          # @!attribute flagged_fields
          #   The keys of the flagged fields if submitting an object.
          #
          #   @return [Array<String>, nil]
          optional :flagged_fields, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!attribute labels
          #
          #   @return [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label>, nil]
          optional :labels,
                   -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label] }

          # @!method initialize(id:, flagged:, probability:, flagged_fields: nil, labels: nil, type: :classifier)
          #   Classifier policy.
          #
          #   @param id [String] The unique identifier for the classifier output.
          #
          #   @param flagged [Boolean]
          #
          #   @param probability [Float]
          #
          #   @param flagged_fields [Array<String>] The keys of the flagged fields if submitting an object.
          #
          #   @param labels [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label>]
          #
          #   @param type [Symbol, :classifier]

          class Label < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute flagged
            #
            #   @return [Boolean]
            required :flagged, ModerationAPI::Internal::Type::Boolean

            # @!attribute probability
            #
            #   @return [Float]
            required :probability, Float

            # @!method initialize(id:, flagged:, probability:)
            #   @param id [String]
            #   @param flagged [Boolean]
            #   @param probability [Float]
          end
        end

        class EntityMatcherOutput < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute flagged
          #
          #   @return [Boolean]
          required :flagged, ModerationAPI::Internal::Type::Boolean

          # @!attribute matches
          #
          #   @return [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match>]
          required :matches,
                   -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match] }

          # @!attribute probability
          #
          #   @return [Float]
          required :probability, Float

          # @!attribute type
          #
          #   @return [Symbol, :entity_matcher]
          required :type, const: :entity_matcher

          # @!attribute flagged_fields
          #
          #   @return [Array<String>, nil]
          optional :flagged_fields, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!method initialize(id:, flagged:, matches:, probability:, flagged_fields: nil, type: :entity_matcher)
          #   Entity matcher policy.
          #
          #   @param id [String]
          #   @param flagged [Boolean]
          #   @param matches [Array<ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match>]
          #   @param probability [Float]
          #   @param flagged_fields [Array<String>]
          #   @param type [Symbol, :entity_matcher]

          class Match < ModerationAPI::Internal::Type::BaseModel
            # @!attribute match
            #
            #   @return [String]
            required :match, String

            # @!attribute probability
            #
            #   @return [Float]
            required :probability, Float

            # @!attribute span
            #
            #   @return [Array<Integer>]
            required :span, ModerationAPI::Internal::Type::ArrayOf[Integer]

            # @!method initialize(match:, probability:, span:)
            #   @param match [String]
            #   @param probability [Float]
            #   @param span [Array<Integer>]
          end
        end

        # @!method self.variants
        #   @return [Array(ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput, ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput)]
      end

      # @see ModerationAPI::Models::ContentSubmitResponse#recommendation
      class Recommendation < ModerationAPI::Internal::Type::BaseModel
        # @!attribute action
        #   The action to take based on the recommendation
        #
        #   @return [Symbol, ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action]
        required :action, enum: -> { ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action }

        # @!attribute reason_codes
        #   The reason code for the recommendation. Can be used to display a reason to the
        #   user.
        #
        #   @return [Array<Symbol, ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode>]
        required :reason_codes,
                 -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode] }

        # @!method initialize(action:, reason_codes:)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ContentSubmitResponse::Recommendation} for more details.
        #
        #   The recommendation for the content based on the evaluation.
        #
        #   @param action [Symbol, ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action] The action to take based on the recommendation
        #
        #   @param reason_codes [Array<Symbol, ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode>] The reason code for the recommendation. Can be used to display a reason to the u

        # The action to take based on the recommendation
        #
        # @see ModerationAPI::Models::ContentSubmitResponse::Recommendation#action
        module Action
          extend ModerationAPI::Internal::Type::Enum

          REVIEW = :review
          ALLOW = :allow
          REJECT = :reject

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module ReasonCode
          extend ModerationAPI::Internal::Type::Enum

          SEVERITY_REJECT = :severity_reject
          SEVERITY_REVIEW = :severity_review
          AUTHOR_BLOCK = :author_block
          DRY_RUN = :dry_run
          TRUSTED_ALLOW = :trusted_allow
          UNTRUSTED_SEVERITY = :untrusted_severity

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Error < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(id:, message:)
        #   @param id [String]
        #   @param message [String]
      end
    end
  end
end
