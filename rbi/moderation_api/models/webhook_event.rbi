# typed: strong

module ModerationAPI
  module Models
    # Discriminated union of every v2 webhook event. Switch on `type` to narrow to a
    # specific event shape.
    module WebhookEvent
      extend ModerationAPI::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ModerationAPI::WebhookEvent::AuthorBlocked,
            ModerationAPI::WebhookEvent::AuthorUnblocked,
            ModerationAPI::WebhookEvent::AuthorSuspended,
            ModerationAPI::WebhookEvent::AuthorUpdated,
            ModerationAPI::WebhookEvent::AuthorTrustLevelChanged,
            ModerationAPI::WebhookEvent::AuthorAction,
            ModerationAPI::WebhookEvent::QueueItemResolved,
            ModerationAPI::WebhookEvent::QueueItemAction,
            ModerationAPI::WebhookEvent::QueueItemRejected,
            ModerationAPI::WebhookEvent::QueueItemAllowed
          )
        end

      class AuthorBlocked < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorBlocked,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::AuthorBlocked::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::AuthorBlocked::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::AuthorBlocked::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.blocked"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorBlocked::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorBlocked::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object: ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # The author the action was performed on
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                author:
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::OrHash,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                queue:
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # The author the action was performed on
              author:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  author:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  queue:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class AuthorUnblocked < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorUnblocked,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::AuthorUnblocked::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::AuthorUnblocked::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::AuthorUnblocked::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.unblocked"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorUnblocked::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorUnblocked::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # The author the action was performed on
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                author:
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::OrHash,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                queue:
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # The author the action was performed on
              author:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  author:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  queue:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class AuthorSuspended < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorSuspended,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::AuthorSuspended::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::AuthorSuspended::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::AuthorSuspended::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.suspended"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorSuspended::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorSuspended::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # The author the action was performed on
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                author:
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::OrHash,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                queue:
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # The author the action was performed on
              author:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  author:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  queue:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class AuthorUpdated < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorUpdated,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::AuthorUpdated::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::AuthorUpdated::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::AuthorUpdated::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.updated"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorUpdated::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorUpdated::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object: ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Author ID in Moderation API
            sig { returns(String) }
            attr_accessor :id

            # Block or suspension details, if applicable. Null if the author is enabled.
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block
                )
              )
            end
            attr_reader :block

            sig do
              params(
                block:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block::OrHash
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
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata
              )
            end
            attr_reader :metadata

            sig do
              params(
                metadata:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata::OrHash
              ).void
            end
            attr_writer :metadata

            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics
              )
            end
            attr_reader :metrics

            sig do
              params(
                metrics:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics::OrHash
              ).void
            end
            attr_writer :metrics

            # Risk assessment details, if available.
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation
                )
              )
            end
            attr_reader :risk_evaluation

            sig do
              params(
                risk_evaluation:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation::OrHash
                  )
              ).void
            end
            attr_writer :risk_evaluation

            # Current author status
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::OrSymbol
              )
            end
            attr_accessor :status

            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel
              )
            end
            attr_reader :trust_level

            sig do
              params(
                trust_level:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel::OrHash
              ).void
            end
            attr_writer :trust_level

            # The author's company or organization
            sig { returns(T.nilable(String)) }
            attr_accessor :company

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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block::OrHash
                  ),
                first_seen: Float,
                last_seen: Float,
                metadata:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata::OrHash,
                metrics:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics::OrHash,
                risk_evaluation:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation::OrHash
                  ),
                status:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::OrSymbol,
                trust_level:
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel::OrHash,
                company: T.nilable(String),
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
              # The author's company or organization
              company: nil,
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
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel,
                  company: T.nilable(String),
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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block,
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
                params(
                  reason: T.nilable(String),
                  until_: T.nilable(Float)
                ).returns(T.attached_class)
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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata,
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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics,
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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Calculated risk level based on more than 10 behavioral signals.
              sig { returns(T.nilable(Float)) }
              attr_accessor :risk_level

              # Risk assessment details, if available.
              sig do
                params(risk_level: T.nilable(Float)).returns(T.attached_class)
              end
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
                  T.all(
                    Symbol,
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENABLED =
                T.let(
                  :enabled,
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::TaggedSymbol
                )
              SUSPENDED =
                T.let(
                  :suspended,
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::TaggedSymbol
                )
              BLOCKED =
                T.let(
                  :blocked,
                  ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status::TaggedSymbol
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
                    ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel,
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
                params(level: Float, manual: T::Boolean).returns(
                  T.attached_class
                )
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

      class AuthorTrustLevelChanged < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorTrustLevelChanged,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig do
          returns(ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data)
        end
        attr_reader :data

        sig do
          params(
            data:
              ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data:
              ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.trust_level_changed"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object
            )
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Author ID in Moderation API
            sig { returns(String) }
            attr_accessor :id

            # Block or suspension details, if applicable. Null if the author is enabled.
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block
                )
              )
            end
            attr_reader :block

            sig do
              params(
                block:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block::OrHash
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
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata
              )
            end
            attr_reader :metadata

            sig do
              params(
                metadata:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata::OrHash
              ).void
            end
            attr_writer :metadata

            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics
              )
            end
            attr_reader :metrics

            sig do
              params(
                metrics:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics::OrHash
              ).void
            end
            attr_writer :metrics

            # Risk assessment details, if available.
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation
                )
              )
            end
            attr_reader :risk_evaluation

            sig do
              params(
                risk_evaluation:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation::OrHash
                  )
              ).void
            end
            attr_writer :risk_evaluation

            # Current author status
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::OrSymbol
              )
            end
            attr_accessor :status

            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel
              )
            end
            attr_reader :trust_level

            sig do
              params(
                trust_level:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel::OrHash
              ).void
            end
            attr_writer :trust_level

            # The author's company or organization
            sig { returns(T.nilable(String)) }
            attr_accessor :company

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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block::OrHash
                  ),
                first_seen: Float,
                last_seen: Float,
                metadata:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata::OrHash,
                metrics:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics::OrHash,
                risk_evaluation:
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation::OrHash
                  ),
                status:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::OrSymbol,
                trust_level:
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel::OrHash,
                company: T.nilable(String),
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
              # The author's company or organization
              company: nil,
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
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel,
                  company: T.nilable(String),
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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block,
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
                params(
                  reason: T.nilable(String),
                  until_: T.nilable(Float)
                ).returns(T.attached_class)
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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata,
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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics,
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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Calculated risk level based on more than 10 behavioral signals.
              sig { returns(T.nilable(Float)) }
              attr_accessor :risk_level

              # Risk assessment details, if available.
              sig do
                params(risk_level: T.nilable(Float)).returns(T.attached_class)
              end
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
                  T.all(
                    Symbol,
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENABLED =
                T.let(
                  :enabled,
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::TaggedSymbol
                )
              SUSPENDED =
                T.let(
                  :suspended,
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::TaggedSymbol
                )
              BLOCKED =
                T.let(
                  :blocked,
                  ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status::TaggedSymbol
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
                    ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel,
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
                params(level: Float, manual: T::Boolean).returns(
                  T.attached_class
                )
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

      class AuthorAction < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::AuthorAction,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::AuthorAction::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::AuthorAction::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::AuthorAction::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"author.action"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::AuthorAction::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::AuthorAction::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::AuthorAction::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorAction::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::AuthorAction::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object: ModerationAPI::WebhookEvent::AuthorAction::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # The author the action was performed on
            sig do
              returns(
                ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                author:
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::OrHash,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                queue:
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # The author the action was performed on
              author:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  author:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  queue:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class QueueItemResolved < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::QueueItemResolved,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::QueueItemResolved::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::QueueItemResolved::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::QueueItemResolved::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"queue_item.resolved"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::QueueItemResolved::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::QueueItemResolved::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object
            )
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig do
              returns(
                ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item
              )
            end
            attr_reader :item

            sig do
              params(
                item:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::OrHash
              ).void
            end
            attr_writer :item

            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author
                )
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                item:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::OrHash,
                author:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::OrHash,
                queue:
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(item:, author: nil, queue: nil)
            end

            sig do
              override.returns(
                {
                  item:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item,
                  author:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author,
                  queue:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Item < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Content ID from your system
              sig { returns(String) }
              attr_accessor :id

              # External author ID (the customer's identifier, not Moderation API's internal id)
              sig { returns(T.nilable(String)) }
              attr_accessor :author_id

              # The channel the content was submitted to, identified by your customer-defined
              # channel key.
              sig { returns(T.nilable(String)) }
              attr_accessor :channel_key

              # A recommendation from your own client-side flagging.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction
                  )
                )
              end
              attr_reader :client_action

              sig do
                params(
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::OrHash
                    )
                ).void
              end
              attr_writer :client_action

              # The original content payload
              sig do
                returns(
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object
                  )
                )
              end
              attr_accessor :content

              # Conversation grouping ID, if any
              sig { returns(T.nilable(String)) }
              attr_accessor :conversation_id

              # Whether the content was flagged by moderation
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :flagged

              # Moderation labels applied to the content
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label
                    ]
                  )
                )
              end
              attr_accessor :labels

              # Detected ISO language code, if available
              sig { returns(T.nilable(String)) }
              attr_accessor :language

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::OrSymbol
                  )
                )
              end
              attr_accessor :meta_type

              # Arbitrary key/value metadata. Top-level keys are strings.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :metadata

              # ISO 8601 timestamp of when the content was submitted
              sig { returns(Time) }
              attr_accessor :timestamp

              sig do
                params(
                  id: String,
                  author_id: T.nilable(String),
                  channel_key: T.nilable(String),
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::OrHash
                    ),
                  content:
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::OrHash
                    ),
                  conversation_id: T.nilable(String),
                  flagged: T.nilable(T::Boolean),
                  labels:
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::OrHash
                      ]
                    ),
                  language: T.nilable(String),
                  meta_type:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::OrSymbol
                    ),
                  metadata: T.nilable(T::Hash[Symbol, T.anything]),
                  timestamp: Time
                ).returns(T.attached_class)
              end
              def self.new(
                # Content ID from your system
                id:,
                # External author ID (the customer's identifier, not Moderation API's internal id)
                author_id:,
                # The channel the content was submitted to, identified by your customer-defined
                # channel key.
                channel_key:,
                # A recommendation from your own client-side flagging.
                client_action:,
                # The original content payload
                content:,
                # Conversation grouping ID, if any
                conversation_id:,
                # Whether the content was flagged by moderation
                flagged:,
                # Moderation labels applied to the content
                labels:,
                # Detected ISO language code, if available
                language:,
                # High-level content type (e.g. message, post, comment). Defaults to the channel's
                # configured content type but can be overridden per request via the moderation API
                # `type` field.
                meta_type:,
                # Arbitrary key/value metadata. Top-level keys are strings.
                metadata:,
                # ISO 8601 timestamp of when the content was submitted
                timestamp:
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    author_id: T.nilable(String),
                    channel_key: T.nilable(String),
                    client_action:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction
                      ),
                    content:
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object
                      ),
                    conversation_id: T.nilable(String),
                    flagged: T.nilable(T::Boolean),
                    labels:
                      T.nilable(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label
                        ]
                      ),
                    language: T.nilable(String),
                    meta_type:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::OrSymbol
                      ),
                    metadata: T.nilable(T::Hash[Symbol, T.anything]),
                    timestamp: Time
                  }
                )
              end
              def to_hash
              end

              class ClientAction < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Your recommendation for the content: allow, review, or reject.
                sig do
                  returns(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::OrSymbol
                  )
                end
                attr_accessor :action

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                sig do
                  returns(
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # A human-readable explanation for your recommendation.
                sig { returns(T.nilable(String)) }
                attr_reader :reason

                sig { params(reason: String).void }
                attr_writer :reason

                # Where your recommendation came from, e.g. "banned-ip".
                sig { returns(T.nilable(String)) }
                attr_reader :source

                sig { params(source: String).void }
                attr_writer :source

                # A recommendation from your own client-side flagging.
                sig do
                  params(
                    action:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::OrSymbol,
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                    reason: String,
                    source: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Your recommendation for the content: allow, review, or reject.
                  action:,
                  # How your recommendation combines with ours. Defaults to 'escalate', which only
                  # applies it when stricter than ours; 'override' replaces ours outright.
                  behavior: nil,
                  # A human-readable explanation for your recommendation.
                  reason: nil,
                  # Where your recommendation came from, e.g. "banned-ip".
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      action:
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::OrSymbol,
                      behavior:
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                      reason: String,
                      source: String
                    }
                  )
                end
                def to_hash
                end

                # Your recommendation for the content: allow, review, or reject.
                module Action
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  REVIEW =
                    T.let(
                      :review,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  ALLOW =
                    T.let(
                      :allow,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  REJECT =
                    T.let(
                      :reject,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Action::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                module Behavior
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OVERRIDE =
                    T.let(
                      :override,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )
                  ESCALATE =
                    T.let(
                      :escalate,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # The original content payload
              module Content
                extend ModerationAPI::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object
                    )
                  end

                class Text < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The content text
                  sig { returns(String) }
                  attr_accessor :text

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Text
                  sig do
                    params(text: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The content text
                    text:,
                    type: :text
                  )
                  end

                  sig { override.returns({ text: String, type: Symbol }) }
                  def to_hash
                  end
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Base64-encoded image data. Either url or data must be provided. Note: base64
                  # images are not stored and will not appear in the review queue.
                  sig { returns(T.nilable(String)) }
                  attr_reader :data

                  sig { params(data: String).void }
                  attr_writer :data

                  # A public URL of the image content. Either url or data must be provided.
                  sig { returns(T.nilable(String)) }
                  attr_reader :url

                  sig { params(url: String).void }
                  attr_writer :url

                  # Image
                  sig do
                    params(data: String, url: String, type: Symbol).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Base64-encoded image data. Either url or data must be provided. Note: base64
                    # images are not stored and will not appear in the review queue.
                    data: nil,
                    # A public URL of the image content. Either url or data must be provided.
                    url: nil,
                    type: :image
                  )
                  end

                  sig do
                    override.returns(
                      { type: Symbol, data: String, url: String }
                    )
                  end
                  def to_hash
                  end
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # A public URL of the video content
                  sig { returns(String) }
                  attr_accessor :url

                  # Video
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # A public URL of the video content
                    url:,
                    type: :video
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # The URL of the audio content
                  sig { returns(String) }
                  attr_accessor :url

                  # Audio
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The URL of the audio content
                    url:,
                    type: :audio
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # Values in the object. Can be mixed content types.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio
                        )
                      ]
                    )
                  end
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Object
                  sig do
                    params(
                      data:
                        T::Hash[
                          Symbol,
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio::OrHash
                          )
                        ],
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Values in the object. Can be mixed content types.
                    data:,
                    type: :object
                  )
                  end

                  sig do
                    override.returns(
                      {
                        data:
                          T::Hash[
                            Symbol,
                            T.any(
                              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text,
                              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image,
                              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video,
                              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio
                            )
                          ],
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio
                        )
                      end

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      # The content text
                      sig { returns(String) }
                      attr_accessor :text

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Text
                      sig do
                        params(text: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The content text
                        text:,
                        type: :text
                      )
                      end

                      sig { override.returns({ text: String, type: Symbol }) }
                      def to_hash
                      end
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Base64-encoded image data. Either url or data must be provided. Note: base64
                      # images are not stored and will not appear in the review queue.
                      sig { returns(T.nilable(String)) }
                      attr_reader :data

                      sig { params(data: String).void }
                      attr_writer :data

                      # A public URL of the image content. Either url or data must be provided.
                      sig { returns(T.nilable(String)) }
                      attr_reader :url

                      sig { params(url: String).void }
                      attr_writer :url

                      # Image
                      sig do
                        params(data: String, url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # Base64-encoded image data. Either url or data must be provided. Note: base64
                        # images are not stored and will not appear in the review queue.
                        data: nil,
                        # A public URL of the image content. Either url or data must be provided.
                        url: nil,
                        type: :image
                      )
                      end

                      sig do
                        override.returns(
                          { type: Symbol, data: String, url: String }
                        )
                      end
                      def to_hash
                      end
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # A public URL of the video content
                      sig { returns(String) }
                      attr_accessor :url

                      # Video
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # A public URL of the video content
                        url:,
                        type: :video
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # The URL of the audio content
                      sig { returns(String) }
                      attr_accessor :url

                      # Audio
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The URL of the audio content
                        url:,
                        type: :audio
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # The label name
                sig { returns(String) }
                attr_accessor :label

                # Confidence score between 0 and 1
                sig { returns(Float) }
                attr_accessor :score

                # Whether this label crossed its flagging threshold
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :flagged

                sig { params(flagged: T::Boolean).void }
                attr_writer :flagged

                # True if the label was applied manually by a moderator
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :manual

                sig { params(manual: T::Boolean).void }
                attr_writer :manual

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match
                      ]
                    )
                  )
                end
                attr_reader :matches

                sig do
                  params(
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).void
                end
                attr_writer :matches

                sig do
                  params(
                    label: String,
                    score: Float,
                    flagged: T::Boolean,
                    manual: T::Boolean,
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The label name
                  label:,
                  # Confidence score between 0 and 1
                  score:,
                  # Whether this label crossed its flagging threshold
                  flagged: nil,
                  # True if the label was applied manually by a moderator
                  manual: nil,
                  matches: nil
                )
                end

                sig do
                  override.returns(
                    {
                      label: String,
                      score: Float,
                      flagged: T::Boolean,
                      manual: T::Boolean,
                      matches:
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match
                        ]
                    }
                  )
                end
                def to_hash
                end

                class Match < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The matched substring
                  sig { returns(String) }
                  attr_accessor :match

                  # Match confidence between 0 and 1
                  sig { returns(Float) }
                  attr_accessor :probability

                  # [start, end] character offsets in the source text
                  sig { returns(T::Array[T.anything]) }
                  attr_accessor :span

                  sig { returns(T.nilable(String)) }
                  attr_reader :entity_type

                  sig { params(entity_type: String).void }
                  attr_writer :entity_type

                  sig { returns(T.nilable(String)) }
                  attr_accessor :mask

                  sig { returns(T.nilable(T::Array[String])) }
                  attr_reader :reasons

                  sig { params(reasons: T::Array[String]).void }
                  attr_writer :reasons

                  sig do
                    returns(
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals
                      )
                    )
                  end
                  attr_reader :signals

                  sig do
                    params(
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::OrHash
                    ).void
                  end
                  attr_writer :signals

                  sig do
                    params(
                      match: String,
                      probability: Float,
                      span: T::Array[T.anything],
                      entity_type: String,
                      mask: T.nilable(String),
                      reasons: T::Array[String],
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # The matched substring
                    match:,
                    # Match confidence between 0 and 1
                    probability:,
                    # [start, end] character offsets in the source text
                    span:,
                    entity_type: nil,
                    mask: nil,
                    reasons: nil,
                    signals: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        match: String,
                        probability: Float,
                        span: T::Array[T.anything],
                        entity_type: String,
                        mask: T.nilable(String),
                        reasons: T::Array[String],
                        signals:
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals
                      }
                    )
                  end
                  def to_hash
                  end

                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals,
                          ModerationAPI::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :bot_protection

                    sig do
                      returns(
                        T.nilable(
                          ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                        )
                      )
                    end
                    attr_reader :brand_impersonation

                    sig do
                      params(
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          )
                      ).void
                    end
                    attr_writer :brand_impersonation

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :domain_age_days

                    sig { returns(T.nilable(String)) }
                    attr_accessor :final_url

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :has_email_setup

                    sig { returns(T::Boolean) }
                    attr_accessor :has_suspicious_characters

                    sig { returns(T::Boolean) }
                    attr_accessor :is_link_shortener

                    sig { returns(T::Boolean) }
                    attr_accessor :is_reported

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :redirect_count

                    sig do
                      params(
                        bot_protection: T.nilable(T::Boolean),
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          ),
                        domain_age_days: T.nilable(Float),
                        final_url: T.nilable(String),
                        has_email_setup: T.nilable(T::Boolean),
                        has_suspicious_characters: T::Boolean,
                        is_link_shortener: T::Boolean,
                        is_reported: T::Boolean,
                        redirect_count: T.nilable(Float)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      bot_protection:,
                      brand_impersonation:,
                      domain_age_days:,
                      final_url:,
                      has_email_setup:,
                      has_suspicious_characters:,
                      is_link_shortener:,
                      is_reported:,
                      redirect_count:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          bot_protection: T.nilable(T::Boolean),
                          brand_impersonation:
                            T.nilable(
                              ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                            ),
                          domain_age_days: T.nilable(Float),
                          final_url: T.nilable(String),
                          has_email_setup: T.nilable(T::Boolean),
                          has_suspicious_characters: T::Boolean,
                          is_link_shortener: T::Boolean,
                          is_reported: T::Boolean,
                          redirect_count: T.nilable(Float)
                        }
                      )
                    end
                    def to_hash
                    end

                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(String) }
                      attr_accessor :brand

                      sig { returns(String) }
                      attr_accessor :method_

                      sig do
                        params(brand: String, method_: String).returns(
                          T.attached_class
                        )
                      end
                      def self.new(brand:, method_:)
                      end

                      sig do
                        override.returns({ brand: String, method_: String })
                      end
                      def to_hash
                      end
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PROFILE =
                  T.let(
                    :profile,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                MESSAGE =
                  T.let(
                    :message,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                POST =
                  T.let(
                    :post,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                COMMENT =
                  T.let(
                    :comment,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                EVENT =
                  T.let(
                    :event,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                PRODUCT =
                  T.let(
                    :product,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                REVIEW =
                  T.let(
                    :review,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )
                OTHER =
                  T.let(
                    :other,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class QueueItemAction < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::QueueItemAction,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::QueueItemAction::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::QueueItemAction::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::QueueItemAction::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"queue_item.action"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::QueueItemAction::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::QueueItemAction::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::QueueItemAction::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The author the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author
                )
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # The content item the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item
                )
              )
            end
            attr_reader :item

            sig do
              params(
                item:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::OrHash
              ).void
            end
            attr_writer :item

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                author:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::OrHash,
                item:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::OrHash,
                queue:
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The author the action was performed on, if any
              author: nil,
              # The content item the action was performed on, if any
              item: nil,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  author:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author,
                  item:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item,
                  queue:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on, if any
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Item < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Content ID from your system
              sig { returns(String) }
              attr_accessor :id

              # External author ID (the customer's identifier, not Moderation API's internal id)
              sig { returns(T.nilable(String)) }
              attr_accessor :author_id

              # The channel the content was submitted to, identified by your customer-defined
              # channel key.
              sig { returns(T.nilable(String)) }
              attr_accessor :channel_key

              # A recommendation from your own client-side flagging.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction
                  )
                )
              end
              attr_reader :client_action

              sig do
                params(
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::OrHash
                    )
                ).void
              end
              attr_writer :client_action

              # The original content payload
              sig do
                returns(
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object
                  )
                )
              end
              attr_accessor :content

              # Conversation grouping ID, if any
              sig { returns(T.nilable(String)) }
              attr_accessor :conversation_id

              # Whether the content was flagged by moderation
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :flagged

              # Moderation labels applied to the content
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label
                    ]
                  )
                )
              end
              attr_accessor :labels

              # Detected ISO language code, if available
              sig { returns(T.nilable(String)) }
              attr_accessor :language

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::OrSymbol
                  )
                )
              end
              attr_accessor :meta_type

              # Arbitrary key/value metadata. Top-level keys are strings.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :metadata

              # ISO 8601 timestamp of when the content was submitted
              sig { returns(Time) }
              attr_accessor :timestamp

              # The content item the action was performed on, if any
              sig do
                params(
                  id: String,
                  author_id: T.nilable(String),
                  channel_key: T.nilable(String),
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::OrHash
                    ),
                  content:
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::OrHash
                    ),
                  conversation_id: T.nilable(String),
                  flagged: T.nilable(T::Boolean),
                  labels:
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::OrHash
                      ]
                    ),
                  language: T.nilable(String),
                  meta_type:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::OrSymbol
                    ),
                  metadata: T.nilable(T::Hash[Symbol, T.anything]),
                  timestamp: Time
                ).returns(T.attached_class)
              end
              def self.new(
                # Content ID from your system
                id:,
                # External author ID (the customer's identifier, not Moderation API's internal id)
                author_id:,
                # The channel the content was submitted to, identified by your customer-defined
                # channel key.
                channel_key:,
                # A recommendation from your own client-side flagging.
                client_action:,
                # The original content payload
                content:,
                # Conversation grouping ID, if any
                conversation_id:,
                # Whether the content was flagged by moderation
                flagged:,
                # Moderation labels applied to the content
                labels:,
                # Detected ISO language code, if available
                language:,
                # High-level content type (e.g. message, post, comment). Defaults to the channel's
                # configured content type but can be overridden per request via the moderation API
                # `type` field.
                meta_type:,
                # Arbitrary key/value metadata. Top-level keys are strings.
                metadata:,
                # ISO 8601 timestamp of when the content was submitted
                timestamp:
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    author_id: T.nilable(String),
                    channel_key: T.nilable(String),
                    client_action:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction
                      ),
                    content:
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object
                      ),
                    conversation_id: T.nilable(String),
                    flagged: T.nilable(T::Boolean),
                    labels:
                      T.nilable(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label
                        ]
                      ),
                    language: T.nilable(String),
                    meta_type:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::OrSymbol
                      ),
                    metadata: T.nilable(T::Hash[Symbol, T.anything]),
                    timestamp: Time
                  }
                )
              end
              def to_hash
              end

              class ClientAction < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Your recommendation for the content: allow, review, or reject.
                sig do
                  returns(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::OrSymbol
                  )
                end
                attr_accessor :action

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                sig do
                  returns(
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # A human-readable explanation for your recommendation.
                sig { returns(T.nilable(String)) }
                attr_reader :reason

                sig { params(reason: String).void }
                attr_writer :reason

                # Where your recommendation came from, e.g. "banned-ip".
                sig { returns(T.nilable(String)) }
                attr_reader :source

                sig { params(source: String).void }
                attr_writer :source

                # A recommendation from your own client-side flagging.
                sig do
                  params(
                    action:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::OrSymbol,
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                    reason: String,
                    source: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Your recommendation for the content: allow, review, or reject.
                  action:,
                  # How your recommendation combines with ours. Defaults to 'escalate', which only
                  # applies it when stricter than ours; 'override' replaces ours outright.
                  behavior: nil,
                  # A human-readable explanation for your recommendation.
                  reason: nil,
                  # Where your recommendation came from, e.g. "banned-ip".
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      action:
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::OrSymbol,
                      behavior:
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                      reason: String,
                      source: String
                    }
                  )
                end
                def to_hash
                end

                # Your recommendation for the content: allow, review, or reject.
                module Action
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  REVIEW =
                    T.let(
                      :review,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  ALLOW =
                    T.let(
                      :allow,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  REJECT =
                    T.let(
                      :reject,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Action::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                module Behavior
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OVERRIDE =
                    T.let(
                      :override,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )
                  ESCALATE =
                    T.let(
                      :escalate,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # The original content payload
              module Content
                extend ModerationAPI::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object
                    )
                  end

                class Text < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The content text
                  sig { returns(String) }
                  attr_accessor :text

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Text
                  sig do
                    params(text: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The content text
                    text:,
                    type: :text
                  )
                  end

                  sig { override.returns({ text: String, type: Symbol }) }
                  def to_hash
                  end
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Base64-encoded image data. Either url or data must be provided. Note: base64
                  # images are not stored and will not appear in the review queue.
                  sig { returns(T.nilable(String)) }
                  attr_reader :data

                  sig { params(data: String).void }
                  attr_writer :data

                  # A public URL of the image content. Either url or data must be provided.
                  sig { returns(T.nilable(String)) }
                  attr_reader :url

                  sig { params(url: String).void }
                  attr_writer :url

                  # Image
                  sig do
                    params(data: String, url: String, type: Symbol).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Base64-encoded image data. Either url or data must be provided. Note: base64
                    # images are not stored and will not appear in the review queue.
                    data: nil,
                    # A public URL of the image content. Either url or data must be provided.
                    url: nil,
                    type: :image
                  )
                  end

                  sig do
                    override.returns(
                      { type: Symbol, data: String, url: String }
                    )
                  end
                  def to_hash
                  end
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # A public URL of the video content
                  sig { returns(String) }
                  attr_accessor :url

                  # Video
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # A public URL of the video content
                    url:,
                    type: :video
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # The URL of the audio content
                  sig { returns(String) }
                  attr_accessor :url

                  # Audio
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The URL of the audio content
                    url:,
                    type: :audio
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # Values in the object. Can be mixed content types.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio
                        )
                      ]
                    )
                  end
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Object
                  sig do
                    params(
                      data:
                        T::Hash[
                          Symbol,
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio::OrHash
                          )
                        ],
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Values in the object. Can be mixed content types.
                    data:,
                    type: :object
                  )
                  end

                  sig do
                    override.returns(
                      {
                        data:
                          T::Hash[
                            Symbol,
                            T.any(
                              ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text,
                              ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image,
                              ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video,
                              ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio
                            )
                          ],
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio
                        )
                      end

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      # The content text
                      sig { returns(String) }
                      attr_accessor :text

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Text
                      sig do
                        params(text: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The content text
                        text:,
                        type: :text
                      )
                      end

                      sig { override.returns({ text: String, type: Symbol }) }
                      def to_hash
                      end
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Base64-encoded image data. Either url or data must be provided. Note: base64
                      # images are not stored and will not appear in the review queue.
                      sig { returns(T.nilable(String)) }
                      attr_reader :data

                      sig { params(data: String).void }
                      attr_writer :data

                      # A public URL of the image content. Either url or data must be provided.
                      sig { returns(T.nilable(String)) }
                      attr_reader :url

                      sig { params(url: String).void }
                      attr_writer :url

                      # Image
                      sig do
                        params(data: String, url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # Base64-encoded image data. Either url or data must be provided. Note: base64
                        # images are not stored and will not appear in the review queue.
                        data: nil,
                        # A public URL of the image content. Either url or data must be provided.
                        url: nil,
                        type: :image
                      )
                      end

                      sig do
                        override.returns(
                          { type: Symbol, data: String, url: String }
                        )
                      end
                      def to_hash
                      end
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # A public URL of the video content
                      sig { returns(String) }
                      attr_accessor :url

                      # Video
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # A public URL of the video content
                        url:,
                        type: :video
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # The URL of the audio content
                      sig { returns(String) }
                      attr_accessor :url

                      # Audio
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The URL of the audio content
                        url:,
                        type: :audio
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # The label name
                sig { returns(String) }
                attr_accessor :label

                # Confidence score between 0 and 1
                sig { returns(Float) }
                attr_accessor :score

                # Whether this label crossed its flagging threshold
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :flagged

                sig { params(flagged: T::Boolean).void }
                attr_writer :flagged

                # True if the label was applied manually by a moderator
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :manual

                sig { params(manual: T::Boolean).void }
                attr_writer :manual

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match
                      ]
                    )
                  )
                end
                attr_reader :matches

                sig do
                  params(
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).void
                end
                attr_writer :matches

                sig do
                  params(
                    label: String,
                    score: Float,
                    flagged: T::Boolean,
                    manual: T::Boolean,
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The label name
                  label:,
                  # Confidence score between 0 and 1
                  score:,
                  # Whether this label crossed its flagging threshold
                  flagged: nil,
                  # True if the label was applied manually by a moderator
                  manual: nil,
                  matches: nil
                )
                end

                sig do
                  override.returns(
                    {
                      label: String,
                      score: Float,
                      flagged: T::Boolean,
                      manual: T::Boolean,
                      matches:
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match
                        ]
                    }
                  )
                end
                def to_hash
                end

                class Match < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The matched substring
                  sig { returns(String) }
                  attr_accessor :match

                  # Match confidence between 0 and 1
                  sig { returns(Float) }
                  attr_accessor :probability

                  # [start, end] character offsets in the source text
                  sig { returns(T::Array[T.anything]) }
                  attr_accessor :span

                  sig { returns(T.nilable(String)) }
                  attr_reader :entity_type

                  sig { params(entity_type: String).void }
                  attr_writer :entity_type

                  sig { returns(T.nilable(String)) }
                  attr_accessor :mask

                  sig { returns(T.nilable(T::Array[String])) }
                  attr_reader :reasons

                  sig { params(reasons: T::Array[String]).void }
                  attr_writer :reasons

                  sig do
                    returns(
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals
                      )
                    )
                  end
                  attr_reader :signals

                  sig do
                    params(
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::OrHash
                    ).void
                  end
                  attr_writer :signals

                  sig do
                    params(
                      match: String,
                      probability: Float,
                      span: T::Array[T.anything],
                      entity_type: String,
                      mask: T.nilable(String),
                      reasons: T::Array[String],
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # The matched substring
                    match:,
                    # Match confidence between 0 and 1
                    probability:,
                    # [start, end] character offsets in the source text
                    span:,
                    entity_type: nil,
                    mask: nil,
                    reasons: nil,
                    signals: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        match: String,
                        probability: Float,
                        span: T::Array[T.anything],
                        entity_type: String,
                        mask: T.nilable(String),
                        reasons: T::Array[String],
                        signals:
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals
                      }
                    )
                  end
                  def to_hash
                  end

                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals,
                          ModerationAPI::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :bot_protection

                    sig do
                      returns(
                        T.nilable(
                          ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                        )
                      )
                    end
                    attr_reader :brand_impersonation

                    sig do
                      params(
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          )
                      ).void
                    end
                    attr_writer :brand_impersonation

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :domain_age_days

                    sig { returns(T.nilable(String)) }
                    attr_accessor :final_url

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :has_email_setup

                    sig { returns(T::Boolean) }
                    attr_accessor :has_suspicious_characters

                    sig { returns(T::Boolean) }
                    attr_accessor :is_link_shortener

                    sig { returns(T::Boolean) }
                    attr_accessor :is_reported

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :redirect_count

                    sig do
                      params(
                        bot_protection: T.nilable(T::Boolean),
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          ),
                        domain_age_days: T.nilable(Float),
                        final_url: T.nilable(String),
                        has_email_setup: T.nilable(T::Boolean),
                        has_suspicious_characters: T::Boolean,
                        is_link_shortener: T::Boolean,
                        is_reported: T::Boolean,
                        redirect_count: T.nilable(Float)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      bot_protection:,
                      brand_impersonation:,
                      domain_age_days:,
                      final_url:,
                      has_email_setup:,
                      has_suspicious_characters:,
                      is_link_shortener:,
                      is_reported:,
                      redirect_count:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          bot_protection: T.nilable(T::Boolean),
                          brand_impersonation:
                            T.nilable(
                              ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                            ),
                          domain_age_days: T.nilable(Float),
                          final_url: T.nilable(String),
                          has_email_setup: T.nilable(T::Boolean),
                          has_suspicious_characters: T::Boolean,
                          is_link_shortener: T::Boolean,
                          is_reported: T::Boolean,
                          redirect_count: T.nilable(Float)
                        }
                      )
                    end
                    def to_hash
                    end

                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(String) }
                      attr_accessor :brand

                      sig { returns(String) }
                      attr_accessor :method_

                      sig do
                        params(brand: String, method_: String).returns(
                          T.attached_class
                        )
                      end
                      def self.new(brand:, method_:)
                      end

                      sig do
                        override.returns({ brand: String, method_: String })
                      end
                      def to_hash
                      end
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PROFILE =
                  T.let(
                    :profile,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                MESSAGE =
                  T.let(
                    :message,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                POST =
                  T.let(
                    :post,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                COMMENT =
                  T.let(
                    :comment,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                EVENT =
                  T.let(
                    :event,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                PRODUCT =
                  T.let(
                    :product,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                REVIEW =
                  T.let(
                    :review,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )
                OTHER =
                  T.let(
                    :other,
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class QueueItemRejected < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::QueueItemRejected,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::QueueItemRejected::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::QueueItemRejected::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::QueueItemRejected::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"queue_item.rejected"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::QueueItemRejected::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::QueueItemRejected::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object
            )
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The author the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author
                )
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # The content item the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item
                )
              )
            end
            attr_reader :item

            sig do
              params(
                item:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::OrHash
              ).void
            end
            attr_writer :item

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                author:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::OrHash,
                item:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::OrHash,
                queue:
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The author the action was performed on, if any
              author: nil,
              # The content item the action was performed on, if any
              item: nil,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  author:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author,
                  item:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item,
                  queue:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on, if any
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Item < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Content ID from your system
              sig { returns(String) }
              attr_accessor :id

              # External author ID (the customer's identifier, not Moderation API's internal id)
              sig { returns(T.nilable(String)) }
              attr_accessor :author_id

              # The channel the content was submitted to, identified by your customer-defined
              # channel key.
              sig { returns(T.nilable(String)) }
              attr_accessor :channel_key

              # A recommendation from your own client-side flagging.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction
                  )
                )
              end
              attr_reader :client_action

              sig do
                params(
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::OrHash
                    )
                ).void
              end
              attr_writer :client_action

              # The original content payload
              sig do
                returns(
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object
                  )
                )
              end
              attr_accessor :content

              # Conversation grouping ID, if any
              sig { returns(T.nilable(String)) }
              attr_accessor :conversation_id

              # Whether the content was flagged by moderation
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :flagged

              # Moderation labels applied to the content
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label
                    ]
                  )
                )
              end
              attr_accessor :labels

              # Detected ISO language code, if available
              sig { returns(T.nilable(String)) }
              attr_accessor :language

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::OrSymbol
                  )
                )
              end
              attr_accessor :meta_type

              # Arbitrary key/value metadata. Top-level keys are strings.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :metadata

              # ISO 8601 timestamp of when the content was submitted
              sig { returns(Time) }
              attr_accessor :timestamp

              # The content item the action was performed on, if any
              sig do
                params(
                  id: String,
                  author_id: T.nilable(String),
                  channel_key: T.nilable(String),
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::OrHash
                    ),
                  content:
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::OrHash
                    ),
                  conversation_id: T.nilable(String),
                  flagged: T.nilable(T::Boolean),
                  labels:
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::OrHash
                      ]
                    ),
                  language: T.nilable(String),
                  meta_type:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::OrSymbol
                    ),
                  metadata: T.nilable(T::Hash[Symbol, T.anything]),
                  timestamp: Time
                ).returns(T.attached_class)
              end
              def self.new(
                # Content ID from your system
                id:,
                # External author ID (the customer's identifier, not Moderation API's internal id)
                author_id:,
                # The channel the content was submitted to, identified by your customer-defined
                # channel key.
                channel_key:,
                # A recommendation from your own client-side flagging.
                client_action:,
                # The original content payload
                content:,
                # Conversation grouping ID, if any
                conversation_id:,
                # Whether the content was flagged by moderation
                flagged:,
                # Moderation labels applied to the content
                labels:,
                # Detected ISO language code, if available
                language:,
                # High-level content type (e.g. message, post, comment). Defaults to the channel's
                # configured content type but can be overridden per request via the moderation API
                # `type` field.
                meta_type:,
                # Arbitrary key/value metadata. Top-level keys are strings.
                metadata:,
                # ISO 8601 timestamp of when the content was submitted
                timestamp:
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    author_id: T.nilable(String),
                    channel_key: T.nilable(String),
                    client_action:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction
                      ),
                    content:
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object
                      ),
                    conversation_id: T.nilable(String),
                    flagged: T.nilable(T::Boolean),
                    labels:
                      T.nilable(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label
                        ]
                      ),
                    language: T.nilable(String),
                    meta_type:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::OrSymbol
                      ),
                    metadata: T.nilable(T::Hash[Symbol, T.anything]),
                    timestamp: Time
                  }
                )
              end
              def to_hash
              end

              class ClientAction < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Your recommendation for the content: allow, review, or reject.
                sig do
                  returns(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::OrSymbol
                  )
                end
                attr_accessor :action

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                sig do
                  returns(
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # A human-readable explanation for your recommendation.
                sig { returns(T.nilable(String)) }
                attr_reader :reason

                sig { params(reason: String).void }
                attr_writer :reason

                # Where your recommendation came from, e.g. "banned-ip".
                sig { returns(T.nilable(String)) }
                attr_reader :source

                sig { params(source: String).void }
                attr_writer :source

                # A recommendation from your own client-side flagging.
                sig do
                  params(
                    action:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::OrSymbol,
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                    reason: String,
                    source: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Your recommendation for the content: allow, review, or reject.
                  action:,
                  # How your recommendation combines with ours. Defaults to 'escalate', which only
                  # applies it when stricter than ours; 'override' replaces ours outright.
                  behavior: nil,
                  # A human-readable explanation for your recommendation.
                  reason: nil,
                  # Where your recommendation came from, e.g. "banned-ip".
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      action:
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::OrSymbol,
                      behavior:
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                      reason: String,
                      source: String
                    }
                  )
                end
                def to_hash
                end

                # Your recommendation for the content: allow, review, or reject.
                module Action
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  REVIEW =
                    T.let(
                      :review,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  ALLOW =
                    T.let(
                      :allow,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  REJECT =
                    T.let(
                      :reject,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Action::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                module Behavior
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OVERRIDE =
                    T.let(
                      :override,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )
                  ESCALATE =
                    T.let(
                      :escalate,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # The original content payload
              module Content
                extend ModerationAPI::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object
                    )
                  end

                class Text < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The content text
                  sig { returns(String) }
                  attr_accessor :text

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Text
                  sig do
                    params(text: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The content text
                    text:,
                    type: :text
                  )
                  end

                  sig { override.returns({ text: String, type: Symbol }) }
                  def to_hash
                  end
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Base64-encoded image data. Either url or data must be provided. Note: base64
                  # images are not stored and will not appear in the review queue.
                  sig { returns(T.nilable(String)) }
                  attr_reader :data

                  sig { params(data: String).void }
                  attr_writer :data

                  # A public URL of the image content. Either url or data must be provided.
                  sig { returns(T.nilable(String)) }
                  attr_reader :url

                  sig { params(url: String).void }
                  attr_writer :url

                  # Image
                  sig do
                    params(data: String, url: String, type: Symbol).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Base64-encoded image data. Either url or data must be provided. Note: base64
                    # images are not stored and will not appear in the review queue.
                    data: nil,
                    # A public URL of the image content. Either url or data must be provided.
                    url: nil,
                    type: :image
                  )
                  end

                  sig do
                    override.returns(
                      { type: Symbol, data: String, url: String }
                    )
                  end
                  def to_hash
                  end
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # A public URL of the video content
                  sig { returns(String) }
                  attr_accessor :url

                  # Video
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # A public URL of the video content
                    url:,
                    type: :video
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # The URL of the audio content
                  sig { returns(String) }
                  attr_accessor :url

                  # Audio
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The URL of the audio content
                    url:,
                    type: :audio
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # Values in the object. Can be mixed content types.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio
                        )
                      ]
                    )
                  end
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Object
                  sig do
                    params(
                      data:
                        T::Hash[
                          Symbol,
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio::OrHash
                          )
                        ],
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Values in the object. Can be mixed content types.
                    data:,
                    type: :object
                  )
                  end

                  sig do
                    override.returns(
                      {
                        data:
                          T::Hash[
                            Symbol,
                            T.any(
                              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text,
                              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image,
                              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video,
                              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio
                            )
                          ],
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio
                        )
                      end

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      # The content text
                      sig { returns(String) }
                      attr_accessor :text

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Text
                      sig do
                        params(text: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The content text
                        text:,
                        type: :text
                      )
                      end

                      sig { override.returns({ text: String, type: Symbol }) }
                      def to_hash
                      end
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Base64-encoded image data. Either url or data must be provided. Note: base64
                      # images are not stored and will not appear in the review queue.
                      sig { returns(T.nilable(String)) }
                      attr_reader :data

                      sig { params(data: String).void }
                      attr_writer :data

                      # A public URL of the image content. Either url or data must be provided.
                      sig { returns(T.nilable(String)) }
                      attr_reader :url

                      sig { params(url: String).void }
                      attr_writer :url

                      # Image
                      sig do
                        params(data: String, url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # Base64-encoded image data. Either url or data must be provided. Note: base64
                        # images are not stored and will not appear in the review queue.
                        data: nil,
                        # A public URL of the image content. Either url or data must be provided.
                        url: nil,
                        type: :image
                      )
                      end

                      sig do
                        override.returns(
                          { type: Symbol, data: String, url: String }
                        )
                      end
                      def to_hash
                      end
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # A public URL of the video content
                      sig { returns(String) }
                      attr_accessor :url

                      # Video
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # A public URL of the video content
                        url:,
                        type: :video
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # The URL of the audio content
                      sig { returns(String) }
                      attr_accessor :url

                      # Audio
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The URL of the audio content
                        url:,
                        type: :audio
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # The label name
                sig { returns(String) }
                attr_accessor :label

                # Confidence score between 0 and 1
                sig { returns(Float) }
                attr_accessor :score

                # Whether this label crossed its flagging threshold
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :flagged

                sig { params(flagged: T::Boolean).void }
                attr_writer :flagged

                # True if the label was applied manually by a moderator
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :manual

                sig { params(manual: T::Boolean).void }
                attr_writer :manual

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match
                      ]
                    )
                  )
                end
                attr_reader :matches

                sig do
                  params(
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).void
                end
                attr_writer :matches

                sig do
                  params(
                    label: String,
                    score: Float,
                    flagged: T::Boolean,
                    manual: T::Boolean,
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The label name
                  label:,
                  # Confidence score between 0 and 1
                  score:,
                  # Whether this label crossed its flagging threshold
                  flagged: nil,
                  # True if the label was applied manually by a moderator
                  manual: nil,
                  matches: nil
                )
                end

                sig do
                  override.returns(
                    {
                      label: String,
                      score: Float,
                      flagged: T::Boolean,
                      manual: T::Boolean,
                      matches:
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match
                        ]
                    }
                  )
                end
                def to_hash
                end

                class Match < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The matched substring
                  sig { returns(String) }
                  attr_accessor :match

                  # Match confidence between 0 and 1
                  sig { returns(Float) }
                  attr_accessor :probability

                  # [start, end] character offsets in the source text
                  sig { returns(T::Array[T.anything]) }
                  attr_accessor :span

                  sig { returns(T.nilable(String)) }
                  attr_reader :entity_type

                  sig { params(entity_type: String).void }
                  attr_writer :entity_type

                  sig { returns(T.nilable(String)) }
                  attr_accessor :mask

                  sig { returns(T.nilable(T::Array[String])) }
                  attr_reader :reasons

                  sig { params(reasons: T::Array[String]).void }
                  attr_writer :reasons

                  sig do
                    returns(
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals
                      )
                    )
                  end
                  attr_reader :signals

                  sig do
                    params(
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::OrHash
                    ).void
                  end
                  attr_writer :signals

                  sig do
                    params(
                      match: String,
                      probability: Float,
                      span: T::Array[T.anything],
                      entity_type: String,
                      mask: T.nilable(String),
                      reasons: T::Array[String],
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # The matched substring
                    match:,
                    # Match confidence between 0 and 1
                    probability:,
                    # [start, end] character offsets in the source text
                    span:,
                    entity_type: nil,
                    mask: nil,
                    reasons: nil,
                    signals: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        match: String,
                        probability: Float,
                        span: T::Array[T.anything],
                        entity_type: String,
                        mask: T.nilable(String),
                        reasons: T::Array[String],
                        signals:
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals
                      }
                    )
                  end
                  def to_hash
                  end

                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals,
                          ModerationAPI::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :bot_protection

                    sig do
                      returns(
                        T.nilable(
                          ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                        )
                      )
                    end
                    attr_reader :brand_impersonation

                    sig do
                      params(
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          )
                      ).void
                    end
                    attr_writer :brand_impersonation

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :domain_age_days

                    sig { returns(T.nilable(String)) }
                    attr_accessor :final_url

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :has_email_setup

                    sig { returns(T::Boolean) }
                    attr_accessor :has_suspicious_characters

                    sig { returns(T::Boolean) }
                    attr_accessor :is_link_shortener

                    sig { returns(T::Boolean) }
                    attr_accessor :is_reported

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :redirect_count

                    sig do
                      params(
                        bot_protection: T.nilable(T::Boolean),
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          ),
                        domain_age_days: T.nilable(Float),
                        final_url: T.nilable(String),
                        has_email_setup: T.nilable(T::Boolean),
                        has_suspicious_characters: T::Boolean,
                        is_link_shortener: T::Boolean,
                        is_reported: T::Boolean,
                        redirect_count: T.nilable(Float)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      bot_protection:,
                      brand_impersonation:,
                      domain_age_days:,
                      final_url:,
                      has_email_setup:,
                      has_suspicious_characters:,
                      is_link_shortener:,
                      is_reported:,
                      redirect_count:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          bot_protection: T.nilable(T::Boolean),
                          brand_impersonation:
                            T.nilable(
                              ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                            ),
                          domain_age_days: T.nilable(Float),
                          final_url: T.nilable(String),
                          has_email_setup: T.nilable(T::Boolean),
                          has_suspicious_characters: T::Boolean,
                          is_link_shortener: T::Boolean,
                          is_reported: T::Boolean,
                          redirect_count: T.nilable(Float)
                        }
                      )
                    end
                    def to_hash
                    end

                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(String) }
                      attr_accessor :brand

                      sig { returns(String) }
                      attr_accessor :method_

                      sig do
                        params(brand: String, method_: String).returns(
                          T.attached_class
                        )
                      end
                      def self.new(brand:, method_:)
                      end

                      sig do
                        override.returns({ brand: String, method_: String })
                      end
                      def to_hash
                      end
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PROFILE =
                  T.let(
                    :profile,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                MESSAGE =
                  T.let(
                    :message,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                POST =
                  T.let(
                    :post,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                COMMENT =
                  T.let(
                    :comment,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                EVENT =
                  T.let(
                    :event,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                PRODUCT =
                  T.let(
                    :product,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                REVIEW =
                  T.let(
                    :review,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )
                OTHER =
                  T.let(
                    :other,
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class QueueItemAllowed < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::WebhookEvent::QueueItemAllowed,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Stable event ID. Use this to dedupe retries.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :api_version

        # ISO 8601 timestamp of when the event was emitted.
        sig { returns(Time) }
        attr_accessor :created

        sig { returns(ModerationAPI::WebhookEvent::QueueItemAllowed::Data) }
        attr_reader :data

        sig do
          params(
            data: ModerationAPI::WebhookEvent::QueueItemAllowed::Data::OrHash
          ).void
        end
        attr_writer :data

        # The event type.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created: Time,
            data: ModerationAPI::WebhookEvent::QueueItemAllowed::Data::OrHash,
            api_version: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable event ID. Use this to dedupe retries.
          id:,
          # ISO 8601 timestamp of when the event was emitted.
          created:,
          data:,
          api_version: :v2,
          # The event type.
          type: :"queue_item.allowed"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              api_version: Symbol,
              created: Time,
              data: ModerationAPI::WebhookEvent::QueueItemAllowed::Data,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::WebhookEvent::QueueItemAllowed::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig do
            returns(ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object)
          end
          attr_reader :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::OrHash
            ).void
          end
          attr_writer :object

          sig do
            params(
              object:
                ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::OrHash
            ).returns(T.attached_class)
          end
          def self.new(object:)
          end

          sig do
            override.returns(
              {
                object:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object
              }
            )
          end
          def to_hash
          end

          class Object < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Moderation action ID
            sig { returns(String) }
            attr_accessor :id

            # ISO 8601 timestamp of when the action was performed
            sig { returns(Time) }
            attr_accessor :created_at

            # Customer-defined key identifying this action
            sig { returns(T.nilable(String)) }
            attr_accessor :key

            # Display name of the action
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # The value passed to the action when it ran
            sig { returns(T.nilable(String)) }
            attr_accessor :value

            # The author the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author
                )
              )
            end
            attr_reader :author

            sig do
              params(
                author:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::OrHash
              ).void
            end
            attr_writer :author

            # The content item the action was performed on, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item
                )
              )
            end
            attr_reader :item

            sig do
              params(
                item:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::OrHash
              ).void
            end
            attr_writer :item

            # The queue the item belongs to, if any
            sig do
              returns(
                T.nilable(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue
                )
              )
            end
            attr_reader :queue

            sig do
              params(
                queue:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue::OrHash
              ).void
            end
            attr_writer :queue

            sig do
              params(
                id: String,
                created_at: Time,
                key: T.nilable(String),
                name: T.nilable(String),
                value: T.nilable(String),
                author:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::OrHash,
                item:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::OrHash,
                queue:
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Moderation action ID
              id:,
              # ISO 8601 timestamp of when the action was performed
              created_at:,
              # Customer-defined key identifying this action
              key:,
              # Display name of the action
              name:,
              # The value passed to the action when it ran
              value:,
              # The author the action was performed on, if any
              author: nil,
              # The content item the action was performed on, if any
              item: nil,
              # The queue the item belongs to, if any
              queue: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  key: T.nilable(String),
                  name: T.nilable(String),
                  value: T.nilable(String),
                  author:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author,
                  item:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item,
                  queue:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue
                }
              )
            end
            def to_hash
            end

            class Author < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Author ID in Moderation API
              sig { returns(String) }
              attr_accessor :id

              # Block or suspension details, if applicable. Null if the author is enabled.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block
                  )
                )
              end
              attr_reader :block

              sig do
                params(
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block::OrHash
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
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata
                )
              end
              attr_reader :metadata

              sig do
                params(
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata::OrHash
                ).void
              end
              attr_writer :metadata

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics
                )
              end
              attr_reader :metrics

              sig do
                params(
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics::OrHash
                ).void
              end
              attr_writer :metrics

              # Risk assessment details, if available.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation
                  )
                )
              end
              attr_reader :risk_evaluation

              sig do
                params(
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation::OrHash
                    )
                ).void
              end
              attr_writer :risk_evaluation

              # Current author status
              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::OrSymbol
                )
              end
              attr_accessor :status

              sig do
                returns(
                  ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel
                )
              end
              attr_reader :trust_level

              sig do
                params(
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel::OrHash
                ).void
              end
              attr_writer :trust_level

              # The author's company or organization
              sig { returns(T.nilable(String)) }
              attr_accessor :company

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

              # The author the action was performed on, if any
              sig do
                params(
                  id: String,
                  block:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block::OrHash
                    ),
                  first_seen: Float,
                  last_seen: Float,
                  metadata:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata::OrHash,
                  metrics:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics::OrHash,
                  risk_evaluation:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation::OrHash
                    ),
                  status:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::OrSymbol,
                  trust_level:
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel::OrHash,
                  company: T.nilable(String),
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
                # The author's company or organization
                company: nil,
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
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block
                      ),
                    first_seen: Float,
                    last_seen: Float,
                    metadata:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata,
                    metrics:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics,
                    risk_evaluation:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation
                      ),
                    status:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::OrSymbol,
                    trust_level:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel,
                    company: T.nilable(String),
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
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block,
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
                  params(
                    reason: T.nilable(String),
                    until_: T.nilable(Float)
                  ).returns(T.attached_class)
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
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata,
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
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics,
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
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Calculated risk level based on more than 10 behavioral signals.
                sig { returns(T.nilable(Float)) }
                attr_accessor :risk_level

                # Risk assessment details, if available.
                sig do
                  params(risk_level: T.nilable(Float)).returns(T.attached_class)
                end
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
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ENABLED =
                  T.let(
                    :enabled,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::TaggedSymbol
                  )
                SUSPENDED =
                  T.let(
                    :suspended,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::TaggedSymbol
                  )
                BLOCKED =
                  T.let(
                    :blocked,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status::TaggedSymbol
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
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel,
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
                  params(level: Float, manual: T::Boolean).returns(
                    T.attached_class
                  )
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

            class Item < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # Content ID from your system
              sig { returns(String) }
              attr_accessor :id

              # External author ID (the customer's identifier, not Moderation API's internal id)
              sig { returns(T.nilable(String)) }
              attr_accessor :author_id

              # The channel the content was submitted to, identified by your customer-defined
              # channel key.
              sig { returns(T.nilable(String)) }
              attr_accessor :channel_key

              # A recommendation from your own client-side flagging.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction
                  )
                )
              end
              attr_reader :client_action

              sig do
                params(
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::OrHash
                    )
                ).void
              end
              attr_writer :client_action

              # The original content payload
              sig do
                returns(
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object
                  )
                )
              end
              attr_accessor :content

              # Conversation grouping ID, if any
              sig { returns(T.nilable(String)) }
              attr_accessor :conversation_id

              # Whether the content was flagged by moderation
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :flagged

              # Moderation labels applied to the content
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label
                    ]
                  )
                )
              end
              attr_accessor :labels

              # Detected ISO language code, if available
              sig { returns(T.nilable(String)) }
              attr_accessor :language

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              sig do
                returns(
                  T.nilable(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::OrSymbol
                  )
                )
              end
              attr_accessor :meta_type

              # Arbitrary key/value metadata. Top-level keys are strings.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :metadata

              # ISO 8601 timestamp of when the content was submitted
              sig { returns(Time) }
              attr_accessor :timestamp

              # The content item the action was performed on, if any
              sig do
                params(
                  id: String,
                  author_id: T.nilable(String),
                  channel_key: T.nilable(String),
                  client_action:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::OrHash
                    ),
                  content:
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio::OrHash,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::OrHash
                    ),
                  conversation_id: T.nilable(String),
                  flagged: T.nilable(T::Boolean),
                  labels:
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::OrHash
                      ]
                    ),
                  language: T.nilable(String),
                  meta_type:
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::OrSymbol
                    ),
                  metadata: T.nilable(T::Hash[Symbol, T.anything]),
                  timestamp: Time
                ).returns(T.attached_class)
              end
              def self.new(
                # Content ID from your system
                id:,
                # External author ID (the customer's identifier, not Moderation API's internal id)
                author_id:,
                # The channel the content was submitted to, identified by your customer-defined
                # channel key.
                channel_key:,
                # A recommendation from your own client-side flagging.
                client_action:,
                # The original content payload
                content:,
                # Conversation grouping ID, if any
                conversation_id:,
                # Whether the content was flagged by moderation
                flagged:,
                # Moderation labels applied to the content
                labels:,
                # Detected ISO language code, if available
                language:,
                # High-level content type (e.g. message, post, comment). Defaults to the channel's
                # configured content type but can be overridden per request via the moderation API
                # `type` field.
                meta_type:,
                # Arbitrary key/value metadata. Top-level keys are strings.
                metadata:,
                # ISO 8601 timestamp of when the content was submitted
                timestamp:
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    author_id: T.nilable(String),
                    channel_key: T.nilable(String),
                    client_action:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction
                      ),
                    content:
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object
                      ),
                    conversation_id: T.nilable(String),
                    flagged: T.nilable(T::Boolean),
                    labels:
                      T.nilable(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label
                        ]
                      ),
                    language: T.nilable(String),
                    meta_type:
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::OrSymbol
                      ),
                    metadata: T.nilable(T::Hash[Symbol, T.anything]),
                    timestamp: Time
                  }
                )
              end
              def to_hash
              end

              class ClientAction < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # Your recommendation for the content: allow, review, or reject.
                sig do
                  returns(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::OrSymbol
                  )
                end
                attr_accessor :action

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                sig do
                  returns(
                    T.nilable(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # A human-readable explanation for your recommendation.
                sig { returns(T.nilable(String)) }
                attr_reader :reason

                sig { params(reason: String).void }
                attr_writer :reason

                # Where your recommendation came from, e.g. "banned-ip".
                sig { returns(T.nilable(String)) }
                attr_reader :source

                sig { params(source: String).void }
                attr_writer :source

                # A recommendation from your own client-side flagging.
                sig do
                  params(
                    action:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::OrSymbol,
                    behavior:
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                    reason: String,
                    source: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Your recommendation for the content: allow, review, or reject.
                  action:,
                  # How your recommendation combines with ours. Defaults to 'escalate', which only
                  # applies it when stricter than ours; 'override' replaces ours outright.
                  behavior: nil,
                  # A human-readable explanation for your recommendation.
                  reason: nil,
                  # Where your recommendation came from, e.g. "banned-ip".
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      action:
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::OrSymbol,
                      behavior:
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::OrSymbol,
                      reason: String,
                      source: String
                    }
                  )
                end
                def to_hash
                end

                # Your recommendation for the content: allow, review, or reject.
                module Action
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  REVIEW =
                    T.let(
                      :review,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  ALLOW =
                    T.let(
                      :allow,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )
                  REJECT =
                    T.let(
                      :reject,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Action::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                # How your recommendation combines with ours. Defaults to 'escalate', which only
                # applies it when stricter than ours; 'override' replaces ours outright.
                module Behavior
                  extend ModerationAPI::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OVERRIDE =
                    T.let(
                      :override,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )
                  ESCALATE =
                    T.let(
                      :escalate,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::ClientAction::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # The original content payload
              module Content
                extend ModerationAPI::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object
                    )
                  end

                class Text < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The content text
                  sig { returns(String) }
                  attr_accessor :text

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Text
                  sig do
                    params(text: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The content text
                    text:,
                    type: :text
                  )
                  end

                  sig { override.returns({ text: String, type: Symbol }) }
                  def to_hash
                  end
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Base64-encoded image data. Either url or data must be provided. Note: base64
                  # images are not stored and will not appear in the review queue.
                  sig { returns(T.nilable(String)) }
                  attr_reader :data

                  sig { params(data: String).void }
                  attr_writer :data

                  # A public URL of the image content. Either url or data must be provided.
                  sig { returns(T.nilable(String)) }
                  attr_reader :url

                  sig { params(url: String).void }
                  attr_writer :url

                  # Image
                  sig do
                    params(data: String, url: String, type: Symbol).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Base64-encoded image data. Either url or data must be provided. Note: base64
                    # images are not stored and will not appear in the review queue.
                    data: nil,
                    # A public URL of the image content. Either url or data must be provided.
                    url: nil,
                    type: :image
                  )
                  end

                  sig do
                    override.returns(
                      { type: Symbol, data: String, url: String }
                    )
                  end
                  def to_hash
                  end
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # A public URL of the video content
                  sig { returns(String) }
                  attr_accessor :url

                  # Video
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # A public URL of the video content
                    url:,
                    type: :video
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # The URL of the audio content
                  sig { returns(String) }
                  attr_accessor :url

                  # Audio
                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(
                    # The URL of the audio content
                    url:,
                    type: :audio
                  )
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # Values in the object. Can be mixed content types.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio
                        )
                      ]
                    )
                  end
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Object
                  sig do
                    params(
                      data:
                        T::Hash[
                          Symbol,
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video::OrHash,
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio::OrHash
                          )
                        ],
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Values in the object. Can be mixed content types.
                    data:,
                    type: :object
                  )
                  end

                  sig do
                    override.returns(
                      {
                        data:
                          T::Hash[
                            Symbol,
                            T.any(
                              ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text,
                              ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image,
                              ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video,
                              ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio
                            )
                          ],
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video,
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio
                        )
                      end

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      # The content text
                      sig { returns(String) }
                      attr_accessor :text

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Text
                      sig do
                        params(text: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The content text
                        text:,
                        type: :text
                      )
                      end

                      sig { override.returns({ text: String, type: Symbol }) }
                      def to_hash
                      end
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # Base64-encoded image data. Either url or data must be provided. Note: base64
                      # images are not stored and will not appear in the review queue.
                      sig { returns(T.nilable(String)) }
                      attr_reader :data

                      sig { params(data: String).void }
                      attr_writer :data

                      # A public URL of the image content. Either url or data must be provided.
                      sig { returns(T.nilable(String)) }
                      attr_reader :url

                      sig { params(url: String).void }
                      attr_writer :url

                      # Image
                      sig do
                        params(data: String, url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # Base64-encoded image data. Either url or data must be provided. Note: base64
                        # images are not stored and will not appear in the review queue.
                        data: nil,
                        # A public URL of the image content. Either url or data must be provided.
                        url: nil,
                        type: :image
                      )
                      end

                      sig do
                        override.returns(
                          { type: Symbol, data: String, url: String }
                        )
                      end
                      def to_hash
                      end
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # A public URL of the video content
                      sig { returns(String) }
                      attr_accessor :url

                      # Video
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # A public URL of the video content
                        url:,
                        type: :video
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      # The URL of the audio content
                      sig { returns(String) }
                      attr_accessor :url

                      # Audio
                      sig do
                        params(url: String, type: Symbol).returns(
                          T.attached_class
                        )
                      end
                      def self.new(
                        # The URL of the audio content
                        url:,
                        type: :audio
                      )
                      end

                      sig { override.returns({ type: Symbol, url: String }) }
                      def to_hash
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label,
                      ModerationAPI::Internal::AnyHash
                    )
                  end

                # The label name
                sig { returns(String) }
                attr_accessor :label

                # Confidence score between 0 and 1
                sig { returns(Float) }
                attr_accessor :score

                # Whether this label crossed its flagging threshold
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :flagged

                sig { params(flagged: T::Boolean).void }
                attr_writer :flagged

                # True if the label was applied manually by a moderator
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :manual

                sig { params(manual: T::Boolean).void }
                attr_writer :manual

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match
                      ]
                    )
                  )
                end
                attr_reader :matches

                sig do
                  params(
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).void
                end
                attr_writer :matches

                sig do
                  params(
                    label: String,
                    score: Float,
                    flagged: T::Boolean,
                    manual: T::Boolean,
                    matches:
                      T::Array[
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::OrHash
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The label name
                  label:,
                  # Confidence score between 0 and 1
                  score:,
                  # Whether this label crossed its flagging threshold
                  flagged: nil,
                  # True if the label was applied manually by a moderator
                  manual: nil,
                  matches: nil
                )
                end

                sig do
                  override.returns(
                    {
                      label: String,
                      score: Float,
                      flagged: T::Boolean,
                      manual: T::Boolean,
                      matches:
                        T::Array[
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match
                        ]
                    }
                  )
                end
                def to_hash
                end

                class Match < ModerationAPI::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match,
                        ModerationAPI::Internal::AnyHash
                      )
                    end

                  # The matched substring
                  sig { returns(String) }
                  attr_accessor :match

                  # Match confidence between 0 and 1
                  sig { returns(Float) }
                  attr_accessor :probability

                  # [start, end] character offsets in the source text
                  sig { returns(T::Array[T.anything]) }
                  attr_accessor :span

                  sig { returns(T.nilable(String)) }
                  attr_reader :entity_type

                  sig { params(entity_type: String).void }
                  attr_writer :entity_type

                  sig { returns(T.nilable(String)) }
                  attr_accessor :mask

                  sig { returns(T.nilable(T::Array[String])) }
                  attr_reader :reasons

                  sig { params(reasons: T::Array[String]).void }
                  attr_writer :reasons

                  sig do
                    returns(
                      T.nilable(
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals
                      )
                    )
                  end
                  attr_reader :signals

                  sig do
                    params(
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::OrHash
                    ).void
                  end
                  attr_writer :signals

                  sig do
                    params(
                      match: String,
                      probability: Float,
                      span: T::Array[T.anything],
                      entity_type: String,
                      mask: T.nilable(String),
                      reasons: T::Array[String],
                      signals:
                        ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # The matched substring
                    match:,
                    # Match confidence between 0 and 1
                    probability:,
                    # [start, end] character offsets in the source text
                    span:,
                    entity_type: nil,
                    mask: nil,
                    reasons: nil,
                    signals: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        match: String,
                        probability: Float,
                        span: T::Array[T.anything],
                        entity_type: String,
                        mask: T.nilable(String),
                        reasons: T::Array[String],
                        signals:
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals
                      }
                    )
                  end
                  def to_hash
                  end

                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals,
                          ModerationAPI::Internal::AnyHash
                        )
                      end

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :bot_protection

                    sig do
                      returns(
                        T.nilable(
                          ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                        )
                      )
                    end
                    attr_reader :brand_impersonation

                    sig do
                      params(
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          )
                      ).void
                    end
                    attr_writer :brand_impersonation

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :domain_age_days

                    sig { returns(T.nilable(String)) }
                    attr_accessor :final_url

                    sig { returns(T.nilable(T::Boolean)) }
                    attr_accessor :has_email_setup

                    sig { returns(T::Boolean) }
                    attr_accessor :has_suspicious_characters

                    sig { returns(T::Boolean) }
                    attr_accessor :is_link_shortener

                    sig { returns(T::Boolean) }
                    attr_accessor :is_reported

                    sig { returns(T.nilable(Float)) }
                    attr_accessor :redirect_count

                    sig do
                      params(
                        bot_protection: T.nilable(T::Boolean),
                        brand_impersonation:
                          T.nilable(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation::OrHash
                          ),
                        domain_age_days: T.nilable(Float),
                        final_url: T.nilable(String),
                        has_email_setup: T.nilable(T::Boolean),
                        has_suspicious_characters: T::Boolean,
                        is_link_shortener: T::Boolean,
                        is_reported: T::Boolean,
                        redirect_count: T.nilable(Float)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      bot_protection:,
                      brand_impersonation:,
                      domain_age_days:,
                      final_url:,
                      has_email_setup:,
                      has_suspicious_characters:,
                      is_link_shortener:,
                      is_reported:,
                      redirect_count:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          bot_protection: T.nilable(T::Boolean),
                          brand_impersonation:
                            T.nilable(
                              ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                            ),
                          domain_age_days: T.nilable(Float),
                          final_url: T.nilable(String),
                          has_email_setup: T.nilable(T::Boolean),
                          has_suspicious_characters: T::Boolean,
                          is_link_shortener: T::Boolean,
                          is_reported: T::Boolean,
                          redirect_count: T.nilable(Float)
                        }
                      )
                    end
                    def to_hash
                    end

                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation,
                            ModerationAPI::Internal::AnyHash
                          )
                        end

                      sig { returns(String) }
                      attr_accessor :brand

                      sig { returns(String) }
                      attr_accessor :method_

                      sig do
                        params(brand: String, method_: String).returns(
                          T.attached_class
                        )
                      end
                      def self.new(brand:, method_:)
                      end

                      sig do
                        override.returns({ brand: String, method_: String })
                      end
                      def to_hash
                      end
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PROFILE =
                  T.let(
                    :profile,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                MESSAGE =
                  T.let(
                    :message,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                POST =
                  T.let(
                    :post,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                COMMENT =
                  T.let(
                    :comment,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                EVENT =
                  T.let(
                    :event,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                PRODUCT =
                  T.let(
                    :product,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                REVIEW =
                  T.let(
                    :review,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )
                OTHER =
                  T.let(
                    :other,
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Queue < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :id

              # The queue the item belongs to, if any
              sig { params(id: String).returns(T.attached_class) }
              def self.new(id:)
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end
          end
        end
      end

      sig { override.returns(T::Array[ModerationAPI::WebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
