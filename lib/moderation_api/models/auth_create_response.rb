# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Auth#create
    class AuthCreateResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute message
      #   Message of the authentication
      #
      #   @return [String]
      required :message, String

      # @!attribute project
      #   Name of the authenticated project
      #
      #   @return [String]
      required :project, String

      # @!attribute status
      #   Status of the authentication
      #
      #   @return [String]
      required :status, String

      # @!method initialize(message:, project:, status:)
      #   @param message [String] Message of the authentication
      #
      #   @param project [String] Name of the authenticated project
      #
      #   @param status [String] Status of the authentication
    end
  end
end
