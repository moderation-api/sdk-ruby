# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#delete
    class AuthorDeleteResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean]
      required :success, ModerationAPI::Internal::Type::Boolean

      # @!method initialize(success:)
      #   @param success [Boolean]
    end
  end
end
