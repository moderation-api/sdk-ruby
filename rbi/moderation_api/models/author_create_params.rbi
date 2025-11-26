# typed: strong

module ModerationAPI
  module Models
    class AuthorCreateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::AuthorCreateParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # External ID of the user, typically the ID of the author in your database.
      sig { returns(String) }
      attr_accessor :external_id

      # Author email address
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # URL of the author's external profile
      sig { returns(T.nilable(String)) }
      attr_accessor :external_link

      # Timestamp when author first appeared
      sig { returns(T.nilable(Float)) }
      attr_reader :first_seen

      sig { params(first_seen: Float).void }
      attr_writer :first_seen

      # Timestamp of last activity
      sig { returns(T.nilable(Float)) }
      attr_reader :last_seen

      sig { params(last_seen: Float).void }
      attr_writer :last_seen

      sig { returns(T.nilable(Float)) }
      attr_accessor :manual_trust_level

      # Additional metadata provided by your system. We recommend including any relevant
      # information that may assist in the moderation process.
      sig { returns(T.nilable(ModerationAPI::AuthorCreateParams::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: ModerationAPI::AuthorCreateParams::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Author name or identifier
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # URL of the author's profile picture
      sig { returns(T.nilable(String)) }
      attr_accessor :profile_picture

      sig do
        params(
          external_id: String,
          email: T.nilable(String),
          external_link: T.nilable(String),
          first_seen: Float,
          last_seen: Float,
          manual_trust_level: T.nilable(Float),
          metadata: ModerationAPI::AuthorCreateParams::Metadata::OrHash,
          name: T.nilable(String),
          profile_picture: T.nilable(String),
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # External ID of the user, typically the ID of the author in your database.
        external_id:,
        # Author email address
        email: nil,
        # URL of the author's external profile
        external_link: nil,
        # Timestamp when author first appeared
        first_seen: nil,
        # Timestamp of last activity
        last_seen: nil,
        manual_trust_level: nil,
        # Additional metadata provided by your system. We recommend including any relevant
        # information that may assist in the moderation process.
        metadata: nil,
        # Author name or identifier
        name: nil,
        # URL of the author's profile picture
        profile_picture: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            external_id: String,
            email: T.nilable(String),
            external_link: T.nilable(String),
            first_seen: Float,
            last_seen: Float,
            manual_trust_level: T.nilable(Float),
            metadata: ModerationAPI::AuthorCreateParams::Metadata,
            name: T.nilable(String),
            profile_picture: T.nilable(String),
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Metadata < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::AuthorCreateParams::Metadata,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Whether the author's email is verified
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :email_verified

        # Whether the author's identity is verified
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :identity_verified

        # Whether the author is a paying customer
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :is_paying_customer

        # Whether the author's phone number is verified
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :phone_verified

        # Additional metadata provided by your system. We recommend including any relevant
        # information that may assist in the moderation process.
        sig do
          params(
            email_verified: T.nilable(T::Boolean),
            identity_verified: T.nilable(T::Boolean),
            is_paying_customer: T.nilable(T::Boolean),
            phone_verified: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the author's email is verified
          email_verified: nil,
          # Whether the author's identity is verified
          identity_verified: nil,
          # Whether the author is a paying customer
          is_paying_customer: nil,
          # Whether the author's phone number is verified
          phone_verified: nil
        )
        end

        sig do
          override.returns(
            {
              email_verified: T.nilable(T::Boolean),
              identity_verified: T.nilable(T::Boolean),
              is_paying_customer: T.nilable(T::Boolean),
              phone_verified: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
