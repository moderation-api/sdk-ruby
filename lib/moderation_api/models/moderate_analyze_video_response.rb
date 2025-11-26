# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Moderate#analyze_video
    class ModerateAnalyzeVideoResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute author
      #   The author of the content if your account has authors enabled. Requires you to
      #   send authorId when submitting content.
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author, nil]
      required :author, -> { ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author }, nil?: true

      # @!attribute flagged
      #   Whether the content was flagged by any models
      #
      #   @return [Boolean]
      required :flagged, ModerationAPI::Internal::Type::Boolean

      # @!attribute request
      #   Information about the request
      #
      #   @return [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request]
      required :request, -> { ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request }

      # @!attribute status
      #   Success if the request was successful
      #
      #   @return [String]
      required :status, String

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

      # @!method initialize(author:, flagged:, request:, status:, content_id: nil, error: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ModerateAnalyzeVideoResponse} for more details.
      #
      #   @param author [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author, nil] The author of the content if your account has authors enabled. Requires you to s
      #
      #   @param flagged [Boolean] Whether the content was flagged by any models
      #
      #   @param request [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request] Information about the request
      #
      #   @param status [String] Success if the request was successful
      #
      #   @param content_id [String] The ID of the content. Only returned if the content was stored.
      #
      #   @param error [Object] Error message if the request failed

      # @see ModerationAPI::Models::ModerateAnalyzeVideoResponse#author
      class Author < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Author ID in Moderation API
        #
        #   @return [String]
        required :id, String

        # @!attribute block
        #   Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block, nil]
        required :block, -> { ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block }, nil?: true

        # @!attribute status
        #   Current author status
        #
        #   @return [Symbol, ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status]
        required :status, enum: -> { ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status }

        # @!attribute trust_level
        #
        #   @return [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel]
        required :trust_level, -> { ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel }

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
        #   @param block [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
        #
        #   @param status [Symbol, ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status] Current author status
        #
        #   @param trust_level [ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel]
        #
        #   @param external_id [String, nil] The author's ID from your system

        # @see ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author#block
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
        # @see ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author#status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          ENABLED = :enabled
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author#trust_level
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

      # @see ModerationAPI::Models::ModerateAnalyzeVideoResponse#request
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
    end
  end
end
