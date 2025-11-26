# typed: strong

module ModerationAPI
  module Models
    class AuthorUpdateResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::AuthorUpdateResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Author ID in Moderation API
      sig { returns(String) }
      attr_accessor :id

      # Block or suspension details, if applicable. Null if the author is enabled.
      sig do
        returns(T.nilable(ModerationAPI::Models::AuthorUpdateResponse::Block))
      end
      attr_reader :block

      sig do
        params(
          block:
            T.nilable(
              ModerationAPI::Models::AuthorUpdateResponse::Block::OrHash
            )
        ).void
      end
      attr_writer :block

      # Timestamp when author first appeared
      sig { returns(Float) }
      attr_accessor :first_seen

      # Timestamp of last activity
      sig { returns(Float) }
      attr_accessor :last_seen

      # Additional metadata provided by your system. We recommend including any relevant
      # information that may assist in the moderation process.
      sig { returns(ModerationAPI::Models::AuthorUpdateResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata:
            ModerationAPI::Models::AuthorUpdateResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      sig { returns(ModerationAPI::Models::AuthorUpdateResponse::Metrics) }
      attr_reader :metrics

      sig do
        params(
          metrics: ModerationAPI::Models::AuthorUpdateResponse::Metrics::OrHash
        ).void
      end
      attr_writer :metrics

      # Risk assessment details, if available.
      sig do
        returns(
          T.nilable(ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation)
        )
      end
      attr_reader :risk_evaluation

      sig do
        params(
          risk_evaluation:
            T.nilable(
              ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation::OrHash
            )
        ).void
      end
      attr_writer :risk_evaluation

      # Current author status
      sig do
        returns(
          ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      sig { returns(ModerationAPI::Models::AuthorUpdateResponse::TrustLevel) }
      attr_reader :trust_level

      sig do
        params(
          trust_level:
            ModerationAPI::Models::AuthorUpdateResponse::TrustLevel::OrHash
        ).void
      end
      attr_writer :trust_level

      # Author email address
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # The author's ID from your system
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      # URL of the author's external profile
      sig { returns(T.nilable(String)) }
      attr_accessor :external_link

      # Timestamp of last incident
      sig { returns(T.nilable(Float)) }
      attr_accessor :last_incident

      # Author name or identifier
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # URL of the author's profile picture
      sig { returns(T.nilable(String)) }
      attr_accessor :profile_picture

      sig do
        params(
          id: String,
          block:
            T.nilable(
              ModerationAPI::Models::AuthorUpdateResponse::Block::OrHash
            ),
          first_seen: Float,
          last_seen: Float,
          metadata:
            ModerationAPI::Models::AuthorUpdateResponse::Metadata::OrHash,
          metrics: ModerationAPI::Models::AuthorUpdateResponse::Metrics::OrHash,
          risk_evaluation:
            T.nilable(
              ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation::OrHash
            ),
          status: ModerationAPI::Models::AuthorUpdateResponse::Status::OrSymbol,
          trust_level:
            ModerationAPI::Models::AuthorUpdateResponse::TrustLevel::OrHash,
          email: T.nilable(String),
          external_id: T.nilable(String),
          external_link: T.nilable(String),
          last_incident: T.nilable(Float),
          name: T.nilable(String),
          profile_picture: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Author ID in Moderation API
        id:,
        # Block or suspension details, if applicable. Null if the author is enabled.
        block:,
        # Timestamp when author first appeared
        first_seen:,
        # Timestamp of last activity
        last_seen:,
        # Additional metadata provided by your system. We recommend including any relevant
        # information that may assist in the moderation process.
        metadata:,
        metrics:,
        # Risk assessment details, if available.
        risk_evaluation:,
        # Current author status
        status:,
        trust_level:,
        # Author email address
        email: nil,
        # The author's ID from your system
        external_id: nil,
        # URL of the author's external profile
        external_link: nil,
        # Timestamp of last incident
        last_incident: nil,
        # Author name or identifier
        name: nil,
        # URL of the author's profile picture
        profile_picture: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            block:
              T.nilable(ModerationAPI::Models::AuthorUpdateResponse::Block),
            first_seen: Float,
            last_seen: Float,
            metadata: ModerationAPI::Models::AuthorUpdateResponse::Metadata,
            metrics: ModerationAPI::Models::AuthorUpdateResponse::Metrics,
            risk_evaluation:
              T.nilable(
                ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation
              ),
            status:
              ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol,
            trust_level:
              ModerationAPI::Models::AuthorUpdateResponse::TrustLevel,
            email: T.nilable(String),
            external_id: T.nilable(String),
            external_link: T.nilable(String),
            last_incident: T.nilable(Float),
            name: T.nilable(String),
            profile_picture: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Block < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AuthorUpdateResponse::Block,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The moderators reason why the author was blocked or suspended.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # The timestamp until which they are blocked if the author is suspended.
        sig { returns(T.nilable(Float)) }
        attr_accessor :until_

        # Block or suspension details, if applicable. Null if the author is enabled.
        sig do
          params(reason: T.nilable(String), until_: T.nilable(Float)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The moderators reason why the author was blocked or suspended.
          reason: nil,
          # The timestamp until which they are blocked if the author is suspended.
          until_: nil
        )
        end

        sig do
          override.returns(
            { reason: T.nilable(String), until_: T.nilable(Float) }
          )
        end
        def to_hash
        end
      end

      class Metadata < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AuthorUpdateResponse::Metadata,
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

      class Metrics < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AuthorUpdateResponse::Metrics,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Number of flagged content pieces
        sig { returns(Float) }
        attr_accessor :flagged_content

        # Total pieces of content
        sig { returns(Float) }
        attr_accessor :total_content

        # Average sentiment score of content (-1 to 1). Requires a sentiment model in your
        # project.
        sig { returns(T.nilable(Float)) }
        attr_accessor :average_sentiment

        sig do
          params(
            flagged_content: Float,
            total_content: Float,
            average_sentiment: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of flagged content pieces
          flagged_content:,
          # Total pieces of content
          total_content:,
          # Average sentiment score of content (-1 to 1). Requires a sentiment model in your
          # project.
          average_sentiment: nil
        )
        end

        sig do
          override.returns(
            {
              flagged_content: Float,
              total_content: Float,
              average_sentiment: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end

      class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Calculated risk level based on more than 10 behavioral signals.
        sig { returns(T.nilable(Float)) }
        attr_accessor :risk_level

        # Risk assessment details, if available.
        sig { params(risk_level: T.nilable(Float)).returns(T.attached_class) }
        def self.new(
          # Calculated risk level based on more than 10 behavioral signals.
          risk_level: nil
        )
        end

        sig { override.returns({ risk_level: T.nilable(Float) }) }
        def to_hash
        end
      end

      # Current author status
      module Status
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::Models::AuthorUpdateResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol
          )
        SUSPENDED =
          T.let(
            :suspended,
            ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol
          )
        BLOCKED =
          T.let(
            :blocked,
            ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::AuthorUpdateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TrustLevel < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AuthorUpdateResponse::TrustLevel,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Author trust level (-1, 0, 1, 2, 3, or 4)
        sig { returns(Float) }
        attr_accessor :level

        # True if the trust level was set manually by a moderator
        sig { returns(T::Boolean) }
        attr_accessor :manual

        sig do
          params(level: Float, manual: T::Boolean).returns(T.attached_class)
        end
        def self.new(
          # Author trust level (-1, 0, 1, 2, 3, or 4)
          level:,
          # True if the trust level was set manually by a moderator
          manual:
        )
        end

        sig { override.returns({ level: Float, manual: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
