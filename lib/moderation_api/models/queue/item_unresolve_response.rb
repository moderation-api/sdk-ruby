# frozen_string_literal: true

module ModerationAPI
  module Models
    module Queue
      # @see ModerationAPI::Resources::Queue::Items#unresolve
      class ItemUnresolveResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute status
        #   New status of the item
        #
        #   @return [String]
        required :status, String

        # @!attribute success
        #
        #   @return [Boolean]
        required :success, ModerationAPI::Internal::Type::Boolean

        # @!attribute unresolved_at
        #   Timestamp when the item was unresolved
        #
        #   @return [String]
        required :unresolved_at, String, api_name: :unresolvedAt

        # @!method initialize(status:, success:, unresolved_at:)
        #   @param status [String] New status of the item
        #
        #   @param success [Boolean]
        #
        #   @param unresolved_at [String] Timestamp when the item was unresolved
      end
    end
  end
end
