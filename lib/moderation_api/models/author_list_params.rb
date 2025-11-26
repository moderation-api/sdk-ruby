# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#list
    class AuthorListParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute content_types
      #
      #   @return [String, nil]
      optional :content_types, String

      # @!attribute last_active_date
      #
      #   @return [String, nil]
      optional :last_active_date, String

      # @!attribute member_since_date
      #
      #   @return [String, nil]
      optional :member_since_date, String

      # @!attribute page_number
      #   Page number to fetch
      #
      #   @return [String, nil]
      optional :page_number, String

      # @!attribute page_size
      #   Number of authors per page
      #
      #   @return [String, nil]
      optional :page_size, String

      # @!attribute sort_by
      #
      #   @return [Symbol, ModerationAPI::Models::AuthorListParams::SortBy, nil]
      optional :sort_by, enum: -> { ModerationAPI::AuthorListParams::SortBy }

      # @!attribute sort_direction
      #   Sort direction
      #
      #   @return [Symbol, ModerationAPI::Models::AuthorListParams::SortDirection, nil]
      optional :sort_direction, enum: -> { ModerationAPI::AuthorListParams::SortDirection }

      # @!method initialize(content_types: nil, last_active_date: nil, member_since_date: nil, page_number: nil, page_size: nil, sort_by: nil, sort_direction: nil, request_options: {})
      #   @param content_types [String]
      #
      #   @param last_active_date [String]
      #
      #   @param member_since_date [String]
      #
      #   @param page_number [String] Page number to fetch
      #
      #   @param page_size [String] Number of authors per page
      #
      #   @param sort_by [Symbol, ModerationAPI::Models::AuthorListParams::SortBy]
      #
      #   @param sort_direction [Symbol, ModerationAPI::Models::AuthorListParams::SortDirection] Sort direction
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      module SortBy
        extend ModerationAPI::Internal::Type::Enum

        TRUST_LEVEL = :trustLevel
        VIOLATION_COUNT = :violationCount
        REPORT_COUNT = :reportCount
        MEMBER_SINCE = :memberSince
        LAST_ACTIVE = :lastActive
        CONTENT_COUNT = :contentCount
        FLAGGED_CONTENT_RATIO = :flaggedContentRatio
        AVERAGE_SENTIMENT = :averageSentiment

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Sort direction
      module SortDirection
        extend ModerationAPI::Internal::Type::Enum

        ASC = :asc
        DESC = :desc

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
