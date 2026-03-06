# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#retrieve
    class AuthorRetrieveParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   Either external ID or the ID assigned by moderation API.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] Either external ID or the ID assigned by moderation API.
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
