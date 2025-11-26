# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Wordlist#retrieve
    class WordlistRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the wordlist
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Creation date of the wordlist
      #
      #   @return [String]
      required :created_at, String, api_name: :createdAt

      # @!attribute name
      #   Name of the wordlist
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute organization_id
      #   ID of the organization
      #
      #   @return [String]
      required :organization_id, String, api_name: :organizationId

      # @!attribute strict
      #   Strict mode
      #
      #   @return [Boolean]
      required :strict, ModerationAPI::Internal::Type::Boolean

      # @!attribute user_id
      #   ID of the user
      #
      #   @return [String, nil]
      required :user_id, String, api_name: :userId, nil?: true

      # @!attribute words
      #   Words in the wordlist
      #
      #   @return [Array<String>]
      required :words, ModerationAPI::Internal::Type::ArrayOf[String]

      # @!method initialize(id:, created_at:, name:, organization_id:, strict:, user_id:, words:)
      #   @param id [String] ID of the wordlist
      #
      #   @param created_at [String] Creation date of the wordlist
      #
      #   @param name [String, nil] Name of the wordlist
      #
      #   @param organization_id [String] ID of the organization
      #
      #   @param strict [Boolean] Strict mode
      #
      #   @param user_id [String, nil] ID of the user
      #
      #   @param words [Array<String>] Words in the wordlist
    end
  end
end
