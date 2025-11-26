# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Actions#delete
    class ActionDeleteResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the action.
      #
      #   @return [String]
      required :id, String

      # @!attribute deleted
      #   Whether the action was deleted.
      #
      #   @return [Boolean]
      required :deleted, ModerationAPI::Internal::Type::Boolean

      # @!method initialize(id:, deleted:)
      #   @param id [String] The ID of the action.
      #
      #   @param deleted [Boolean] Whether the action was deleted.
    end
  end
end
