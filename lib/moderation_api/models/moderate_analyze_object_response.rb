# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Moderate#analyze_object
    class ModerateAnalyzeObjectResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute author
      #   The author of the content if your account has authors enabled. Requires you to
      #   send authorId when submitting content.
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author, nil]
      required :author, -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author }, nil?: true

      # @!attribute data_found
      #   Whether any entity matchers found data for the content
      #
      #   @return [Boolean]
      required :data_found, ModerationAPI::Internal::Type::Boolean

      # @!attribute entities
      #   The entities found in the content
      #
      #   @return [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity>]
      required :entities,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity] }

      # @!attribute fields
      #   The fields in the object and their flags
      #
      #   @return [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field>]
      required :fields,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field] }

      # @!attribute flagged
      #   Whether the content was flagged by any models
      #
      #   @return [Boolean]
      required :flagged, ModerationAPI::Internal::Type::Boolean

      # @!attribute labels
      #   The scores of each label
      #
      #   @return [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label>]
      required :labels,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label] }

      # @!attribute request
      #   Information about the request
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request]
      required :request, -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request }

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

      # @!attribute content_id
      #   The ID of the content. Only returned if the content was stored.
      #
      #   @return [String, nil]
      optional :content_id, String, api_name: :contentId

      # @!attribute error
      #   Error message if the request failed
      #
      #   @return [Object, nil]
      optional :error, ModerationAPI::Internal::Type::Unknown

      # @!attribute wordlists
      #   The wordlist entity matcher outputs if enabled in your project. Read more at
      #   https://docs.moderationapi.com/models/word
      #
      #   @return [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist>, nil]
      optional :wordlists,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist] }

      # @!method initialize(author:, data_found:, entities:, fields:, flagged:, labels:, request:, status:, unicode_spoofing:, content_id: nil, error: nil, wordlists: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ModerateAnalyzeObjectResponse} for more details.
      #
      #   @param author [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author, nil] The author of the content if your account has authors enabled. Requires you to s
      #
      #   @param data_found [Boolean] Whether any entity matchers found data for the content
      #
      #   @param entities [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity>] The entities found in the content
      #
      #   @param fields [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field>] The fields in the object and their flags
      #
      #   @param flagged [Boolean] Whether the content was flagged by any models
      #
      #   @param labels [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label>] The scores of each label
      #
      #   @param request [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request] Information about the request
      #
      #   @param status [String] Success if the request was successful
      #
      #   @param unicode_spoofing [Boolean] Whether the content is using look-alike characters. Often used by spammers.
      #
      #   @param content_id [String] The ID of the content. Only returned if the content was stored.
      #
      #   @param error [Object] Error message if the request failed
      #
      #   @param wordlists [Array<ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist>] The wordlist entity matcher outputs if enabled in your project. Read more at htt

      # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse#author
      class Author < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Author ID in Moderation API
        #
        #   @return [String]
        required :id, String

        # @!attribute block
        #   Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block, nil]
        required :block, -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block }, nil?: true

        # @!attribute status
        #   Current author status
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status]
        required :status, enum: -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status }

        # @!attribute trust_level
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel]
        required :trust_level, -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel }

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
        #   @param block [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @param status [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status] Current author status
        #
        #   @param trust_level [ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel]
        #
        #   @param external_id [String, nil] The author's ID from your system

        # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author#block
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
        # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          ENABLED = :enabled
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author#trust_level
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

      class Entity < ModerationAPI::Internal::Type::BaseModel
        # @!attribute matches
        #   The matches of the entity
        #
        #   @return [Array<String>]
        required :matches, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute model
        #   The model that found the entity
        #
        #   @return [String]
        required :model, String

        # @!attribute score
        #   The similarity score of the matches
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!method initialize(matches:, model:, score: nil)
        #   @param matches [Array<String>] The matches of the entity
        #
        #   @param model [String] The model that found the entity
        #
        #   @param score [Float] The similarity score of the matches
      end

      class Field < ModerationAPI::Internal::Type::BaseModel
        # @!attribute flagged
        #   Whether the field was flagged
        #
        #   @return [Boolean]
        required :flagged, ModerationAPI::Internal::Type::Boolean

        # @!attribute flagged_by
        #   The models that flagged the field
        #
        #   @return [Array<String>]
        required :flagged_by, ModerationAPI::Internal::Type::ArrayOf[String]

        # @!attribute key
        #   The key of the field
        #
        #   @return [String]
        required :key, String

        # @!method initialize(flagged:, flagged_by:, key:)
        #   @param flagged [Boolean] Whether the field was flagged
        #
        #   @param flagged_by [Array<String>] The models that flagged the field
        #
        #   @param key [String] The key of the field
      end

      class Label < ModerationAPI::Internal::Type::BaseModel
        # @!attribute label
        #   The label of the model
        #
        #   @return [String]
        required :label, String

        # @!attribute model
        #   The model that found the label
        #
        #   @return [String]
        required :model, String

        # @!attribute score
        #   The confidence of the model
        #
        #   @return [Float]
        required :score, Float

        # @!method initialize(label:, model:, score:)
        #   @param label [String] The label of the model
        #
        #   @param model [String] The model that found the label
        #
        #   @param score [Float] The confidence of the model
      end

      # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse#request
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

      class Wordlist < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The ID of the wordlist
        #
        #   @return [String]
        required :id, String

        # @!attribute flagged
        #   Whether the wordlists flagged the content.
        #
        #   @return [Boolean]
        required :flagged, ModerationAPI::Internal::Type::Boolean

        # @!attribute mode
        #   The flagging mode.
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode]
        required :mode, enum: -> { ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode }

        # @!attribute name
        #   The name of the wordlist
        #
        #   @return [String]
        required :name, String

        # @!attribute score
        #   The score of the wordlist
        #
        #   @return [Float]
        required :score, Float

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

        # @!attribute warning
        #   Indicates a warning from the model, e.g. if the text is too short or long and
        #   the model might not be accurate.
        #
        #   @return [String, nil]
        optional :warning, String

        # @!method initialize(id:, flagged:, mode:, name:, score:, components: nil, error: nil, found: nil, matches: nil, warning: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist} for more
        #   details.
        #
        #   @param id [String] The ID of the wordlist
        #
        #   @param flagged [Boolean] Whether the wordlists flagged the content.
        #
        #   @param mode [Symbol, ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode] The flagging mode.
        #
        #   @param name [String] The name of the wordlist
        #
        #   @param score [Float] The score of the wordlist
        #
        #   @param components [Object] The components of the matcher.
        #
        #   @param error [String] Indicates an error with the matcher.
        #
        #   @param found [Boolean] Whether a match was found or not.
        #
        #   @param matches [Array<String>] The matches of the entity matcher.
        #
        #   @param warning [String] Indicates a warning from the model, e.g. if the text is too short or long and th

        # The flagging mode.
        #
        # @see ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist#mode
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          BLOCK_LIST = :BLOCK_LIST
          REQUIRE_LIST = :REQUIRE_LIST
          PASS_LIST = :PASS_LIST

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
