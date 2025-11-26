# frozen_string_literal: true

module ModerationAPI
  module Models
    module Queue
      # @see ModerationAPI::Resources::Queue::Items#unresolve
      class ItemUnresolveParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute id
        #   The queue ID
        #
        #   @return [String]
        required :id, String

        # @!attribute comment
        #   Optional reason for unresolving the item
        #
        #   @return [String, nil]
        optional :comment, String

        # @!method initialize(id:, comment: nil, request_options: {})
        #   @param id [String] The queue ID
        #
        #   @param comment [String] Optional reason for unresolving the item
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
