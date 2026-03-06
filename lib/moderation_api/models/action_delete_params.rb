# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Actions#delete
    class ActionDeleteParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the action to delete.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] The ID of the action to delete.
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
