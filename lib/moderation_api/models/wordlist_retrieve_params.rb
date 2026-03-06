# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Wordlist#retrieve
    class WordlistRetrieveParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   ID of the wordlist to get
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] ID of the wordlist to get
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
