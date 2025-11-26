# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Queue#get_stats
    class QueueGetStatsParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute within_days
      #   Number of days to analyze statistics for
      #
      #   @return [String, nil]
      optional :within_days, String

      # @!method initialize(within_days: nil, request_options: {})
      #   @param within_days [String] Number of days to analyze statistics for
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
