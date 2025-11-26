# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Actions#list
    class ActionListParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute queue_id
      #
      #   @return [String, nil]
      optional :queue_id, String

      # @!method initialize(queue_id: nil, request_options: {})
      #   @param queue_id [String]
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
