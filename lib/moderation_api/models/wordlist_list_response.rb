# frozen_string_literal: true

module ModerationAPI
  module Models
    class WordlistListResponseItem < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier of the wordlist
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the wordlist was created
      #
      #   @return [String, nil]
      required :created_at, String, api_name: :createdAt, nil?: true

      # @!attribute description
      #   Description of the wordlist
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute name
      #   Name of the wordlist
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute user_id
      #   User who created the wordlist
      #
      #   @return [String, nil]
      required :user_id, String, api_name: :userId, nil?: true

      # @!method initialize(id:, created_at:, description:, name:, user_id:)
      #   @param id [String] Unique identifier of the wordlist
      #
      #   @param created_at [String, nil] When the wordlist was created
      #
      #   @param description [String, nil] Description of the wordlist
      #
      #   @param name [String, nil] Name of the wordlist
      #
      #   @param user_id [String, nil] User who created the wordlist
    end

    # @type [ModerationAPI::Internal::Type::Converter]
    WordlistListResponse =
      ModerationAPI::Internal::Type::ArrayOf[-> { ModerationAPI::Models::WordlistListResponseItem }]
  end
end
