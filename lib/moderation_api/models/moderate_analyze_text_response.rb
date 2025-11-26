# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Moderate#analyze_text
    class ModerateAnalyzeTextResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute author
      #   The author of the content if your account has authors enabled. Requires you to
      #   send authorId when submitting content.
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author, nil]
      required :author, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Author }, nil?: true

      # @!attribute content
      #   The content after moderation. With all mask replacements applied and look-alike
      #   characters replaced with the original characters.
      #
      #   @return [String]
      required :content, String

      # @!attribute content_moderated
      #   Whether the content was moderated or not. Same as `content` !== `original`
      #
      #   @return [Boolean]
      required :content_moderated, ModerationAPI::Internal::Type::Boolean

      # @!attribute data_found
      #   Whether any entity matchers found data for the content
      #
      #   @return [Boolean]
      required :data_found, ModerationAPI::Internal::Type::Boolean

      # @!attribute flagged
      #   Whether the content was flagged by any models
      #
      #   @return [Boolean]
      required :flagged, ModerationAPI::Internal::Type::Boolean

      # @!attribute original
      #   The original content
      #
      #   @return [String]
      required :original, String

      # @!attribute request
      #   Information about the request
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Request]
      required :request, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Request }

      # @!attribute status
      #   Success if the request was successful
      #
      #   @return [String]
      required :status, String

      # @!attribute unicode_spoofing
      #   Whether the content is using look-alike characters. Often used by spammers.
      #
      #   @return [Boolean]
      required :unicode_spoofing, ModerationAPI::Internal::Type::Boolean

      # @!attribute address
      #   The address entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/address
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Address, nil]
      optional :address, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Address }

      # @!attribute content_id
      #   The ID of the content. Only returned if the content was stored.
      #
      #   @return [String, nil]
      optional :content_id, String, api_name: :contentId

      # @!attribute email
      #   The email entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/email
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Email, nil]
      optional :email, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Email }

      # @!attribute error
      #   Error message if the request failed
      #
      #   @return [Object, nil]
      optional :error, ModerationAPI::Internal::Type::Unknown

      # @!attribute name
      #   The name entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/name
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Name, nil]
      optional :name, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Name }

      # @!attribute nsfw
      #   The NSFW model output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/nsfw
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw, nil]
      optional :nsfw, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw }

      # @!attribute phone
      #   The phone entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/phone
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone, nil]
      optional :phone, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone }

      # @!attribute profanity
      #   The profanity entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/profanity
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity, nil]
      optional :profanity, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity }

      # @!attribute propriety
      #   The propriety model output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/propriety
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety, nil]
      optional :propriety, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety }

      # @!attribute quality
      #   The spam model output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/spam
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality, nil]
      optional :quality, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality }

      # @!attribute sensitive
      #   The sensitive numbers entity matcher output if enabled in your project. Read
      #   more at https://docs.moderationapi.com/models/sensitive
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive, nil]
      optional :sensitive, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive }

      # @!attribute sentiment
      #   The sentiment model output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/sentiment
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment, nil]
      optional :sentiment, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment }

      # @!attribute toxicity
      #   The toxicity model output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/toxicity
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity, nil]
      optional :toxicity, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity }

      # @!attribute url
      #   The url entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/url
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::URL, nil]
      optional :url, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::URL }

      # @!attribute username
      #   The username entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/username
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Username, nil]
      optional :username, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Username }

      # @!attribute wordlist
      #   The wordlist entity matcher output if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/word
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist, nil]
      optional :wordlist, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist }

      # @!attribute wordlists
      #   The wordlist entity matcher outputs if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/word
      #
      #   @return [Array<ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist>, nil]
      optional :wordlists,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist] }

      # @!method initialize(author:, content:, content_moderated:, data_found:, flagged:, original:, request:, status:, unicode_spoofing:, address: nil, content_id: nil, email: nil, error: nil, name: nil, nsfw: nil, phone: nil, profanity: nil, propriety: nil, quality: nil, sensitive: nil, sentiment: nil, toxicity: nil, url: nil, username: nil, wordlist: nil, wordlists: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ModerateAnalyzeTextResponse} for more details.
      #
      #   Moderation analysis results including model outputs and detected patterns
      #
      #   @param author [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author, nil] The author of the content if your account has authors enabled. Requires you to s
      #
      #   @param content [String] The content after moderation. With all mask replacements applied and look-alike
      #
      #   @param content_moderated [Boolean] Whether the content was moderated or not. Same as `content` !== `original`
      #
      #   @param data_found [Boolean] Whether any entity matchers found data for the content
      #
      #   @param flagged [Boolean] Whether the content was flagged by any models
      #
      #   @param original [String] The original content
      #
      #   @param request [ModerationAPI::Models::ModerateAnalyzeTextResponse::Request] Information about the request
      #
      #   @param status [String] Success if the request was successful
      #
      #   @param unicode_spoofing [Boolean] Whether the content is using look-alike characters. Often used by spammers.
      #
      #   @param address [ModerationAPI::Models::ModerateAnalyzeTextResponse::Address] The address entity matcher output if enabled in your project. Read more at https
      #
      #   @param content_id [String] The ID of the content. Only returned if the content was stored.
      #
      #   @param email [ModerationAPI::Models::ModerateAnalyzeTextResponse::Email] The email entity matcher output if enabled in your project. Read more at https:/
      #
      #   @param error [Object] Error message if the request failed
      #
      #   @param name [ModerationAPI::Models::ModerateAnalyzeTextResponse::Name] The name entity matcher output if enabled in your project. Read more at https://
      #
      #   @param nsfw [ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw] The NSFW model output if enabled in your project. Read more at https://docs.mode
      #
      #   @param phone [ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone] The phone entity matcher output if enabled in your project. Read more at https:/
      #
      #   @param profanity [ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity] The profanity entity matcher output if enabled in your project. Read more at htt
      #
      #   @param propriety [ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety] The propriety model output if enabled in your project. Read more at https://docs
      #
      #   @param quality [ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality] The spam model output if enabled in your project. Read more at https://docs.mode
      #
      #   @param sensitive [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive] The sensitive numbers entity matcher output if enabled in your project. Read mor
      #
      #   @param sentiment [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment] The sentiment model output if enabled in your project. Read more at https://docs
      #
      #   @param toxicity [ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity] The toxicity model output if enabled in your project. Read more at https://docs.
      #
      #   @param url [ModerationAPI::Models::ModerateAnalyzeTextResponse::URL] The url entity matcher output if enabled in your project. Read more at https://d
      #
      #   @param username [ModerationAPI::Models::ModerateAnalyzeTextResponse::Username] The username entity matcher output if enabled in your project. Read more at http
      #
      #   @param wordlist [ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist] The wordlist entity matcher output if enabled in your project. Read more at http
      #
      #   @param wordlists [Array<ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist>] The wordlist entity matcher outputs if enabled in your project. Read more at htt

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#author
      class Author < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Author ID in Moderation API
        #
        #   @return [String]
        required :id, String

        # @!attribute block
        #   Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block, nil]
        required :block, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block }, nil?: true

        # @!attribute status
        #   Current author status
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status]
        required :status, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status }

        # @!attribute trust_level
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel]
        required :trust_level, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel }

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
        #   @param block [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @param status [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status] Current author status
        #
        #   @param trust_level [ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel]
        #
        #   @param external_id [String, nil] The author's ID from your system

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Author#block
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
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Author#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          ENABLED = :enabled
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Author#trust_level
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

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#request
      class Request < ModerationAPI::Internal::Type::BaseModel
        # @!attribute quota_usage
        #   The quota usage of the request
        #
        #   @return [Float]
        required :quota_usage, Float

        # @!attribute timestamp
        #   The timestamp of the request
        #
        #   @return [Float]
        required :timestamp, Float

        # @!method initialize(quota_usage:, timestamp:)
        #   Information about the request
        #
        #   @param quota_usage [Float] The quota usage of the request
        #
        #   @param timestamp [Float] The timestamp of the request
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#address
      class Address < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Address} for more details.
        #
        #   The address entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/address
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Address#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#email
      class Email < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Email} for more details.
        #
        #   The email entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/email
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Email#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#name
      class Name < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Name} for more details.
        #
        #   The name entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/name
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Name#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#nsfw
      class Nsfw < ModerationAPI::Internal::Type::BaseModel
        # @!attribute error
        #   Indicates an error with the model
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute label
        #   The label of the model
        #
        #   @return [String, nil]
        optional :label, String

        # @!attribute label_scores
        #   The confidence of all labels
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores, nil]
        optional :label_scores, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores }

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(error: nil, label: nil, label_scores: nil, score: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw} for more details.
        #
        #   The NSFW model output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/nsfw
        #
        #   @param error [String] Indicates an error with the model
        #
        #   @param label [String] The label of the model
        #
        #   @param label_scores [ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores] The confidence of all labels
        #
        #   @param score [Float] The confidence of the model
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw#label_scores
        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          # @!attribute neutral
          #
          #   @return [Float, nil]
          optional :neutral, Float, api_name: :NEUTRAL

          # @!attribute sensitive
          #   Mentions religion, politics, race, etc., but is neutral or positive.
          #
          #   @return [Float, nil]
          optional :sensitive, Float, api_name: :SENSITIVE

          # @!attribute unsafe
          #   Sexual, hateful, profane, and inappropriate content.
          #
          #   @return [Float, nil]
          optional :unsafe, Float, api_name: :UNSAFE

          # @!method initialize(neutral: nil, sensitive: nil, unsafe: nil)
          #   The confidence of all labels
          #
          #   @param neutral [Float]
          #
          #   @param sensitive [Float] Mentions religion, politics, race, etc., but is neutral or positive.
          #
          #   @param unsafe [Float] Sexual, hateful, profane, and inappropriate content.
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#phone
      class Phone < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone} for more details.
        #
        #   The phone entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/phone
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#profanity
      class Profanity < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity} for more
        #   details.
        #
        #   The profanity entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/profanity
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#propriety
      class Propriety < ModerationAPI::Internal::Type::BaseModel
        # @!attribute error
        #   Indicates an error with the model
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute label
        #   The label of the model
        #
        #   @return [String, nil]
        optional :label, String

        # @!attribute label_scores
        #   The confidence of all labels
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores, nil]
        optional :label_scores, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores }

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(error: nil, label: nil, label_scores: nil, score: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety} for more
        #   details.
        #
        #   The propriety model output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/propriety
        #
        #   @param error [String] Indicates an error with the model
        #
        #   @param label [String] The label of the model
        #
        #   @param label_scores [ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores] The confidence of all labels
        #
        #   @param score [Float] The confidence of the model
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety#label_scores
        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          # @!attribute flirtation
          #   Pickup lines, compliments on appearance, etc.
          #
          #   @return [Float, nil]
          optional :flirtation, Float, api_name: :FLIRTATION

          # @!attribute neutral
          #
          #   @return [Float, nil]
          optional :neutral, Float, api_name: :NEUTRAL

          # @!attribute sexually_explicit
          #   References to sexual acts, body parts, etc.
          #
          #   @return [Float, nil]
          optional :sexually_explicit, Float, api_name: :SEXUALLY_EXPLICIT

          # @!method initialize(flirtation: nil, neutral: nil, sexually_explicit: nil)
          #   The confidence of all labels
          #
          #   @param flirtation [Float] Pickup lines, compliments on appearance, etc.
          #
          #   @param neutral [Float]
          #
          #   @param sexually_explicit [Float] References to sexual acts, body parts, etc.
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#quality
      class Quality < ModerationAPI::Internal::Type::BaseModel
        # @!attribute error
        #   Indicates an error with the model
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute label
        #   The label of the model
        #
        #   @return [String, nil]
        optional :label, String

        # @!attribute label_scores
        #   The confidence of all labels
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores, nil]
        optional :label_scores, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores }

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(error: nil, label: nil, label_scores: nil, score: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality} for more details.
        #
        #   The spam model output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/spam
        #
        #   @param error [String] Indicates an error with the model
        #
        #   @param label [String] The label of the model
        #
        #   @param label_scores [ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores] The confidence of all labels
        #
        #   @param score [Float] The confidence of the model
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality#label_scores
        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          # @!attribute incoherent
          #   Difficult to understand, nonsensical.
          #
          #   @return [Float, nil]
          optional :incoherent, Float, api_name: :INCOHERENT

          # @!attribute neutral
          #
          #   @return [Float, nil]
          optional :neutral, Float, api_name: :NEUTRAL

          # @!attribute spam
          #   Irrelevant and unsolicited commercial content.
          #
          #   @return [Float, nil]
          optional :spam, Float, api_name: :SPAM

          # @!attribute unsubstantial
          #   Trivial or short content.
          #
          #   @return [Float, nil]
          optional :unsubstantial, Float, api_name: :UNSUBSTANTIAL

          # @!method initialize(incoherent: nil, neutral: nil, spam: nil, unsubstantial: nil)
          #   The confidence of all labels
          #
          #   @param incoherent [Float] Difficult to understand, nonsensical.
          #
          #   @param neutral [Float]
          #
          #   @param spam [Float] Irrelevant and unsolicited commercial content.
          #
          #   @param unsubstantial [Float] Trivial or short content.
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#sensitive
      class Sensitive < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive} for more
        #   details.
        #
        #   The sensitive numbers entity matcher output if enabled in your project. Read
        #   more at https://docs.moderationapi.com/models/sensitive
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#sentiment
      class Sentiment < ModerationAPI::Internal::Type::BaseModel
        # @!attribute error
        #   Indicates an error with the model
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute label
        #   The label of the model
        #
        #   @return [String, nil]
        optional :label, String

        # @!attribute label_scores
        #   The confidence of all labels
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores, nil]
        optional :label_scores, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores }

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(error: nil, label: nil, label_scores: nil, score: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment} for more
        #   details.
        #
        #   The sentiment model output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/sentiment
        #
        #   @param error [String] Indicates an error with the model
        #
        #   @param label [String] The label of the model
        #
        #   @param label_scores [ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores] The confidence of all labels
        #
        #   @param score [Float] The confidence of the model
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment#label_scores
        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          # @!attribute negative
          #   Negative sentiment.
          #
          #   @return [Float, nil]
          optional :negative, Float, api_name: :NEGATIVE

          # @!attribute neutral
          #
          #   @return [Float, nil]
          optional :neutral, Float, api_name: :NEUTRAL

          # @!attribute positive
          #   Positive sentiment.
          #
          #   @return [Float, nil]
          optional :positive, Float, api_name: :POSITIVE

          # @!method initialize(negative: nil, neutral: nil, positive: nil)
          #   The confidence of all labels
          #
          #   @param negative [Float] Negative sentiment.
          #
          #   @param neutral [Float]
          #
          #   @param positive [Float] Positive sentiment.
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#toxicity
      class Toxicity < ModerationAPI::Internal::Type::BaseModel
        # @!attribute error
        #   Indicates an error with the model
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute label
        #   The label of the model
        #
        #   @return [String, nil]
        optional :label, String

        # @!attribute label_scores
        #   The confidence of all labels
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores, nil]
        optional :label_scores, -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores }

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(error: nil, label: nil, label_scores: nil, score: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity} for more details.
        #
        #   The toxicity model output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/toxicity
        #
        #   @param error [String] Indicates an error with the model
        #
        #   @param label [String] The label of the model
        #
        #   @param label_scores [ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores] The confidence of all labels
        #
        #   @param score [Float] The confidence of the model
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity#label_scores
        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          # @!attribute discrimination
          #   Discrimination of race, religion, gender, etc.
          #
          #   @return [Float, nil]
          optional :discrimination, Float, api_name: :DISCRIMINATION

          # @!attribute insult
          #   Negative comments about looks or personality etc.
          #
          #   @return [Float, nil]
          optional :insult, Float, api_name: :INSULT

          # @!attribute neutral
          #
          #   @return [Float, nil]
          optional :neutral, Float, api_name: :NEUTRAL

          # @!attribute profanity
          #   Swearing, curse words, and other obscene language.
          #
          #   @return [Float, nil]
          optional :profanity, Float, api_name: :PROFANITY

          # @!attribute severe_toxicity
          #   Very hateful and aggressive content.
          #
          #   @return [Float, nil]
          optional :severe_toxicity, Float, api_name: :SEVERE_TOXICITY

          # @!attribute threat
          #   Content containing intention to harm or violence.
          #
          #   @return [Float, nil]
          optional :threat, Float, api_name: :THREAT

          # @!attribute toxicity
          #   Rude or disrespectful content.
          #
          #   @return [Float, nil]
          optional :toxicity, Float, api_name: :TOXICITY

          # @!method initialize(discrimination: nil, insult: nil, neutral: nil, profanity: nil, severe_toxicity: nil, threat: nil, toxicity: nil)
          #   The confidence of all labels
          #
          #   @param discrimination [Float] Discrimination of race, religion, gender, etc.
          #
          #   @param insult [Float] Negative comments about looks or personality etc.
          #
          #   @param neutral [Float]
          #
          #   @param profanity [Float] Swearing, curse words, and other obscene language.
          #
          #   @param severe_toxicity [Float] Very hateful and aggressive content.
          #
          #   @param threat [Float] Content containing intention to harm or violence.
          #
          #   @param toxicity [Float] Rude or disrespectful content.
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#url
      class URL < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::URL} for more details.
        #
        #   The url entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/url
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::URL#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#username
      class Username < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Username} for more details.
        #
        #   The username entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/username
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Username#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ModerationAPI::Models::ModerateAnalyzeTextResponse#wordlist
      class Wordlist < ModerationAPI::Internal::Type::BaseModel
        # @!attribute components
        #   The components of the matcher.
        #
        #   @return [Object, nil]
        optional :components, ModerationAPI::Internal::Type::Unknown

        # @!attribute error
        #   Indicates an error with the matcher.
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute found
        #   Whether a match was found or not.
        #
        #   @return [Boolean, nil]
        optional :found, ModerationAPI::Internal::Type::Boolean

        # @!attribute matches
        #   The matches of the entity matcher.
        #
        #   @return [Array<String>, nil]
        optional :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute mode
        #   The detection mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode, nil]
        optional :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode }

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(components: nil, error: nil, found: nil, matches: nil, mode: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist} for more details.
        #
        #   The wordlist entity matcher output if enabled in your project. Read more at
        #   https://docs.moderationapi.com/models/word
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode] The detection mode.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The detection mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          NORMAL = :NORMAL
          SUSPICIOUS = :SUSPICIOUS
          PARANOID = :PARANOID

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
