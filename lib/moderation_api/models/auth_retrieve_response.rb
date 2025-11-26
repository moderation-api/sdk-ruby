# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Auth#retrieve
    class AuthRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute message
      #   Message of the authentication
      #
      #   @return [String]
      required :message, String

      # @!attribute status
      #   Status of the authentication
      #
      #   @return [String]
      required :status, String

      # @!method initialize(message:, status:)
      #   @param message [String] Message of the authentication
      #
      #   @param status [String] Status of the authentication
    end
  end
end
