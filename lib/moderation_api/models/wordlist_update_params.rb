# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Wordlist#update
    class WordlistUpdateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute description
      #   New description for the wordlist
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute key
      #   New key for the wordlist
      #
      #   @return [String, nil]
      optional :key, String

      # @!attribute name
      #   New name for the wordlist
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute strict
      #   Deprecated. Now using threshold in project settings.
      #
      #   @return [Boolean, nil]
      optional :strict, ModerationAPI::Internal::Type::Boolean

      # @!attribute words
      #   New words for the wordlist. Replace the existing words with these new ones.
      #   Duplicate words will be ignored.
      #
      #   @return [Array<String>, nil]
      optional :words, ModerationAPI::Internal::Type::ArrayOf[String]

      # @!method initialize(description: nil, key: nil, name: nil, strict: nil, words: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::WordlistUpdateParams} for more details.
      #
      #   @param description [String] New description for the wordlist
      #
      #   @param key [String] New key for the wordlist
      #
      #   @param name [String] New name for the wordlist
      #
      #   @param strict [Boolean] Deprecated. Now using threshold in project settings.
      #
      #   @param words [Array<String>] New words for the wordlist. Replace the existing words with these new ones. Dupl
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
