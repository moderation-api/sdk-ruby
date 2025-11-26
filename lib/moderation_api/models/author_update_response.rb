# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#update
    class AuthorUpdateResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Author ID in Moderation API
      #
      #   @return [String]
      required :id, String

      # @!attribute block
      #   Block or suspension details, if applicable. Null if the author is enabled.
      #
      #   @return [ModerationAPI::Models::AuthorUpdateResponse::Block, nil]
      required :block, -> { ModerationAPI::Models::AuthorUpdateResponse::Block }, nil?: true

      # @!attribute first_seen
      #   Timestamp when author first appeared
      #
      #   @return [Float]
      required :first_seen, Float

      # @!attribute last_seen
      #   Timestamp of last activity
      #
      #   @return [Float]
      required :last_seen, Float

      # @!attribute metadata
      #   Additional metadata provided by your system. We recommend including any relevant
      #   information that may assist in the moderation process.
      #
      #   @return [ModerationAPI::Models::AuthorUpdateResponse::Metadata]
      required :metadata, -> { ModerationAPI::Models::AuthorUpdateResponse::Metadata }

      # @!attribute metrics
      #
      #   @return [ModerationAPI::Models::AuthorUpdateResponse::Metrics]
      required :metrics, -> { ModerationAPI::Models::AuthorUpdateResponse::Metrics }

      # @!attribute risk_evaluation
      #   Risk assessment details, if available.
      #
      #   @return [ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation, nil]
      required :risk_evaluation, -> { ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation }, nil?: true

      # @!attribute status
      #   Current author status
      #
      #   @return [Symbol, ModerationAPI::Models::AuthorUpdateResponse::Status]
      required :status, enum: -> { ModerationAPI::Models::AuthorUpdateResponse::Status }

      # @!attribute trust_level
      #
      #   @return [ModerationAPI::Models::AuthorUpdateResponse::TrustLevel]
      required :trust_level, -> { ModerationAPI::Models::AuthorUpdateResponse::TrustLevel }

      # @!attribute email
      #   Author email address
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute external_id
      #   The author's ID from your system
      #
      #   @return [String, nil]
      optional :external_id, String, nil?: true

      # @!attribute external_link
      #   URL of the author's external profile
      #
      #   @return [String, nil]
      optional :external_link, String, nil?: true

      # @!attribute last_incident
      #   Timestamp of last incident
      #
      #   @return [Float, nil]
      optional :last_incident, Float, nil?: true

      # @!attribute name
      #   Author name or identifier
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute profile_picture
      #   URL of the author's profile picture
      #
      #   @return [String, nil]
      optional :profile_picture, String, nil?: true

      # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::AuthorUpdateResponse} for more details.
      #
      #   @param id [String] Author ID in Moderation API
      #
      #   @param block [ModerationAPI::Models::AuthorUpdateResponse::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
      #
      #   @param first_seen [Float] Timestamp when author first appeared
      #
      #   @param last_seen [Float] Timestamp of last activity
      #
      #   @param metadata [ModerationAPI::Models::AuthorUpdateResponse::Metadata] Additional metadata provided by your system. We recommend including any relevant
      #
      #   @param metrics [ModerationAPI::Models::AuthorUpdateResponse::Metrics]
      #
      #   @param risk_evaluation [ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation, nil] Risk assessment details, if available.
      #
      #   @param status [Symbol, ModerationAPI::Models::AuthorUpdateResponse::Status] Current author status
      #
      #   @param trust_level [ModerationAPI::Models::AuthorUpdateResponse::TrustLevel]
      #
      #   @param email [String, nil] Author email address
      #
      #   @param external_id [String, nil] The author's ID from your system
      #
      #   @param external_link [String, nil] URL of the author's external profile
      #
      #   @param last_incident [Float, nil] Timestamp of last incident
      #
      #   @param name [String, nil] Author name or identifier
      #
      #   @param profile_picture [String, nil] URL of the author's profile picture

      # @see ModerationAPI::Models::AuthorUpdateResponse#block
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

      # @see ModerationAPI::Models::AuthorUpdateResponse#metadata
      class Metadata < ModerationAPI::Internal::Type::BaseModel
        # @!attribute email_verified
        #   Whether the author's email is verified
        #
        #   @return [Boolean, nil]
        optional :email_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute identity_verified
        #   Whether the author's identity is verified
        #
        #   @return [Boolean, nil]
        optional :identity_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute is_paying_customer
        #   Whether the author is a paying customer
        #
        #   @return [Boolean, nil]
        optional :is_paying_customer, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute phone_verified
        #   Whether the author's phone number is verified
        #
        #   @return [Boolean, nil]
        optional :phone_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!method initialize(email_verified: nil, identity_verified: nil, is_paying_customer: nil, phone_verified: nil)
        #   Additional metadata provided by your system. We recommend including any relevant
        #   information that may assist in the moderation process.
        #
        #   @param email_verified [Boolean, nil] Whether the author's email is verified
        #
        #   @param identity_verified [Boolean, nil] Whether the author's identity is verified
        #
        #   @param is_paying_customer [Boolean, nil] Whether the author is a paying customer
        #
        #   @param phone_verified [Boolean, nil] Whether the author's phone number is verified
      end

      # @see ModerationAPI::Models::AuthorUpdateResponse#metrics
      class Metrics < ModerationAPI::Internal::Type::BaseModel
        # @!attribute flagged_content
        #   Number of flagged content pieces
        #
        #   @return [Float]
        required :flagged_content, Float

        # @!attribute total_content
        #   Total pieces of content
        #
        #   @return [Float]
        required :total_content, Float

        # @!attribute average_sentiment
        #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
        #   project.
        #
        #   @return [Float, nil]
        optional :average_sentiment, Float, nil?: true

        # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::AuthorUpdateResponse::Metrics} for more details.
        #
        #   @param flagged_content [Float] Number of flagged content pieces
        #
        #   @param total_content [Float] Total pieces of content
        #
        #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
      end

      # @see ModerationAPI::Models::AuthorUpdateResponse#risk_evaluation
      class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
        # @!attribute risk_level
        #   Calculated risk level based on more than 10 behavioral signals.
        #
        #   @return [Float, nil]
        optional :risk_level, Float, nil?: true

        # @!method initialize(risk_level: nil)
        #   Risk assessment details, if available.
        #
        #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
      end

      # Current author status
      #
      # @see ModerationAPI::Models::AuthorUpdateResponse#status
      module Status
        extend ModerationAPI::Internal::Type::Enum

        ENABLED = :enabled
        SUSPENDED = :suspended
        BLOCKED = :blocked

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ModerationAPI::Models::AuthorUpdateResponse#trust_level
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
  end
end
