# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Authors#create
    class AuthorCreateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute external_id
      #   External ID of the user, typically the ID of the author in your database.
      #
      #   @return [String]
      required :external_id, String

      # @!attribute email
      #   Author email address
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute external_link
      #   URL of the author's external profile
      #
      #   @return [String, nil]
      optional :external_link, String, nil?: true

      # @!attribute first_seen
      #   Timestamp when author first appeared
      #
      #   @return [Float, nil]
      optional :first_seen, Float

      # @!attribute last_seen
      #   Timestamp of last activity
      #
      #   @return [Float, nil]
      optional :last_seen, Float

      # @!attribute manual_trust_level
      #
      #   @return [Float, nil]
      optional :manual_trust_level, Float, nil?: true

      # @!attribute metadata
      #   Additional metadata provided by your system. We recommend including any relevant
      #   information that may assist in the moderation process.
      #
      #   @return [ModerationAPI::Models::AuthorCreateParams::Metadata, nil]
      optional :metadata, -> { ModerationAPI::AuthorCreateParams::Metadata }

      # @!attribute name
      #   Author name or identifier
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute profile_picture
      #   URL of the author's profile picture
      #
      #   @return [String, nil]
      optional :profile_picture, String, nil?: true

      # @!method initialize(external_id:, email: nil, external_link: nil, first_seen: nil, last_seen: nil, manual_trust_level: nil, metadata: nil, name: nil, profile_picture: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::AuthorCreateParams} for more details.
      #
      #   @param external_id [String] External ID of the user, typically the ID of the author in your database.
      #
      #   @param email [String, nil] Author email address
      #
      #   @param external_link [String, nil] URL of the author's external profile
      #
      #   @param first_seen [Float] Timestamp when author first appeared
      #
      #   @param last_seen [Float] Timestamp of last activity
      #
      #   @param manual_trust_level [Float, nil]
      #
      #   @param metadata [ModerationAPI::Models::AuthorCreateParams::Metadata] Additional metadata provided by your system. We recommend including any relevant
      #
      #   @param name [String, nil] Author name or identifier
      #
      #   @param profile_picture [String, nil] URL of the author's profile picture
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      class Metadata < ModerationAPI::Internal::Type::BaseModel
        # @!attribute email_verified
        #   Whether the author's email is verified
        #
        #   @return [Boolean, nil]
        optional :email_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute identity_verified
        #   Whether the author's identity is verified
        #
        #   @return [Boolean, nil]
        optional :identity_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute is_paying_customer
        #   Whether the author is a paying customer
        #
        #   @return [Boolean, nil]
        optional :is_paying_customer, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!attribute phone_verified
        #   Whether the author's phone number is verified
        #
        #   @return [Boolean, nil]
        optional :phone_verified, ModerationAPI::Internal::Type::Boolean, nil?: true

        # @!method initialize(email_verified: nil, identity_verified: nil, is_paying_customer: nil, phone_verified: nil)
        #   Additional metadata provided by your system. We recommend including any relevant
        #   information that may assist in the moderation process.
        #
        #   @param email_verified [Boolean, nil] Whether the author's email is verified
        #
        #   @param identity_verified [Boolean, nil] Whether the author's identity is verified
        #
        #   @param is_paying_customer [Boolean, nil] Whether the author is a paying customer
        #
        #   @param phone_verified [Boolean, nil] Whether the author's phone number is verified
      end
    end
  end
end
