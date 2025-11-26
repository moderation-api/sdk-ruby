# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#list
    class AuthorListResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute authors
      #
      #   @return [Array<ModerationAPI::Models::AuthorListResponse::Author>]
      required :authors,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::AuthorListResponse::Author] }

      # @!attribute pagination
      #
      #   @return [ModerationAPI::Models::AuthorListResponse::Pagination]
      required :pagination, -> { ModerationAPI::Models::AuthorListResponse::Pagination }

      # @!method initialize(authors:, pagination:)
      #   @param authors [Array<ModerationAPI::Models::AuthorListResponse::Author>]
      #   @param pagination [ModerationAPI::Models::AuthorListResponse::Pagination]

      class Author < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Author ID in Moderation API
        #
        #   @return [String]
        required :id, String

        # @!attribute block
        #   Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @return [ModerationAPI::Models::AuthorListResponse::Author::Block, nil]
        required :block, -> { ModerationAPI::Models::AuthorListResponse::Author::Block }, nil?: true

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
        #   @return [ModerationAPI::Models::AuthorListResponse::Author::Metadata]
        required :metadata, -> { ModerationAPI::Models::AuthorListResponse::Author::Metadata }

        # @!attribute metrics
        #
        #   @return [ModerationAPI::Models::AuthorListResponse::Author::Metrics]
        required :metrics, -> { ModerationAPI::Models::AuthorListResponse::Author::Metrics }

        # @!attribute risk_evaluation
        #   Risk assessment details, if available.
        #
        #   @return [ModerationAPI::Models::AuthorListResponse::Author::RiskEvaluation, nil]
        required :risk_evaluation,
                 -> { ModerationAPI::Models::AuthorListResponse::Author::RiskEvaluation },
                 nil?: true

        # @!attribute status
        #   Current author status
        #
        #   @return [Symbol, ModerationAPI::Models::AuthorListResponse::Author::Status]
        required :status, enum: -> { ModerationAPI::Models::AuthorListResponse::Author::Status }

        # @!attribute trust_level
        #
        #   @return [ModerationAPI::Models::AuthorListResponse::Author::TrustLevel]
        required :trust_level, -> { ModerationAPI::Models::AuthorListResponse::Author::TrustLevel }

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
        #   {ModerationAPI::Models::AuthorListResponse::Author} for more details.
        #
        #   @param id [String] Author ID in Moderation API
        #
        #   @param block [ModerationAPI::Models::AuthorListResponse::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @param first_seen [Float] Timestamp when author first appeared
        #
        #   @param last_seen [Float] Timestamp of last activity
        #
        #   @param metadata [ModerationAPI::Models::AuthorListResponse::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
        #
        #   @param metrics [ModerationAPI::Models::AuthorListResponse::Author::Metrics]
        #
        #   @param risk_evaluation [ModerationAPI::Models::AuthorListResponse::Author::RiskEvaluation, nil] Risk assessment details, if available.
        #
        #   @param status [Symbol, ModerationAPI::Models::AuthorListResponse::Author::Status] Current author status
        #
        #   @param trust_level [ModerationAPI::Models::AuthorListResponse::Author::TrustLevel]
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

        # @see ModerationAPI::Models::AuthorListResponse::Author#block
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

        # @see ModerationAPI::Models::AuthorListResponse::Author#metadata
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

        # @see ModerationAPI::Models::AuthorListResponse::Author#metrics
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
          #   {ModerationAPI::Models::AuthorListResponse::Author::Metrics} for more details.
          #
          #   @param flagged_content [Float] Number of flagged content pieces
          #
          #   @param total_content [Float] Total pieces of content
          #
          #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
        end

        # @see ModerationAPI::Models::AuthorListResponse::Author#risk_evaluation
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
        # @see ModerationAPI::Models::AuthorListResponse::Author#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          ENABLED = :enabled
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ModerationAPI::Models::AuthorListResponse::Author#trust_level
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

      # @see ModerationAPI::Models::AuthorListResponse#pagination
      class Pagination < ModerationAPI::Internal::Type::BaseModel
        # @!attribute has_next_page
        #
        #   @return [Boolean]
        required :has_next_page, ModerationAPI::Internal::Type::Boolean, api_name: :hasNextPage

        # @!attribute has_previous_page
        #
        #   @return [Boolean]
        required :has_previous_page, ModerationAPI::Internal::Type::Boolean, api_name: :hasPreviousPage

        # @!attribute page_number
        #
        #   @return [Float]
        required :page_number, Float, api_name: :pageNumber

        # @!attribute page_size
        #
        #   @return [Float]
        required :page_size, Float, api_name: :pageSize

        # @!attribute total
        #
        #   @return [Float]
        required :total, Float

        # @!method initialize(has_next_page:, has_previous_page:, page_number:, page_size:, total:)
        #   @param has_next_page [Boolean]
        #   @param has_previous_page [Boolean]
        #   @param page_number [Float]
        #   @param page_size [Float]
        #   @param total [Float]
      end
    end
  end
end
