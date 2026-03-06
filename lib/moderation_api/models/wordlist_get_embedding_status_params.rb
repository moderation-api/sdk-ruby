# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Wordlist#get_embedding_status
    class WordlistGetEmbeddingStatusParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   ID of the wordlist to check embedding status for
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] ID of the wordlist to check embedding status for
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
