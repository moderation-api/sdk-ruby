# frozen_string_literal: true

module ModerationAPI
  module Models
    module Queue
      # @see ModerationAPI::Resources::Queue::Items#resolve
      class ItemResolveResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute resolved_at
        #   Timestamp when the item was resolved
        #
        #   @return [String]
        required :resolved_at, String, api_name: :resolvedAt

        # @!attribute success
        #
        #   @return [Boolean]
        required :success, ModerationAPI::Internal::Type::Boolean

        # @!attribute comment
        #   Optional comment
        #
        #   @return [String, nil]
        optional :comment, String

        # @!method initialize(resolved_at:, success:, comment: nil)
        #   @param resolved_at [String] Timestamp when the item was resolved
        #
        #   @param success [Boolean]
        #
        #   @param comment [String] Optional comment
      end
    end
  end
end
