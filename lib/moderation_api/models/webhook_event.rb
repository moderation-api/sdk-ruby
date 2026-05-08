# frozen_string_literal: true

module ModerationAPI
  module Models
    # Discriminated union of every v2 webhook event. Switch on `type` to narrow to a
    # specific event shape.
    module WebhookEvent
      extend ModerationAPI::Internal::Type::Union

      discriminator :type

      variant :"author.blocked", -> { ModerationAPI::WebhookEvent::AuthorBlocked }

      variant :"author.unblocked", -> { ModerationAPI::WebhookEvent::AuthorUnblocked }

      variant :"author.suspended", -> { ModerationAPI::WebhookEvent::AuthorSuspended }

      variant :"author.updated", -> { ModerationAPI::WebhookEvent::AuthorUpdated }

      variant :"author.trust_level_changed", -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged }

      variant :"author.action", -> { ModerationAPI::WebhookEvent::AuthorAction }

      variant :"queue_item.resolved", -> { ModerationAPI::WebhookEvent::QueueItemResolved }

      variant :"queue_item.action", -> { ModerationAPI::WebhookEvent::QueueItemAction }

      variant :"queue_item.rejected", -> { ModerationAPI::WebhookEvent::QueueItemRejected }

      variant :"queue_item.allowed", -> { ModerationAPI::WebhookEvent::QueueItemAllowed }

      class AuthorBlocked < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.blocked"]
        required :type, const: :"author.blocked"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.blocked")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.blocked"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute author
            #   The author the action was performed on
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author]
            required :author, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author }

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Queue }

            # @!method initialize(id:, author:, created_at:, key:, name:, value:, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author] The author the action was performed on
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel]
              required :trust_level, -> { ModerationAPI::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author} for
              #   more details.
              #
              #   The author the action was performed on
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorBlocked::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class AuthorUnblocked < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.unblocked"]
        required :type, const: :"author.unblocked"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.unblocked")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.unblocked"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute author
            #   The author the action was performed on
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author]
            required :author, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author }

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Queue }

            # @!method initialize(id:, author:, created_at:, key:, name:, value:, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author] The author the action was performed on
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author} for
              #   more details.
              #
              #   The author the action was performed on
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorUnblocked::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class AuthorSuspended < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.suspended"]
        required :type, const: :"author.suspended"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.suspended")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.suspended"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute author
            #   The author the action was performed on
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author]
            required :author, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author }

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Queue }

            # @!method initialize(id:, author:, created_at:, key:, name:, value:, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author] The author the action was performed on
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author} for
              #   more details.
              #
              #   The author the action was performed on
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorSuspended::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class AuthorUpdated < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.updated"]
        required :type, const: :"author.updated"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.updated")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.updated"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Author ID in Moderation API
            #
            #   @return [String]
            required :id, String

            # @!attribute block
            #   Block or suspension details, if applicable. Null if the author is enabled.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Block, nil]
            required :block,
                     -> {
                       ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Block
                     },
                     nil?: true

            # @!attribute first_seen
            #   Timestamp when author first appeared
            #
            #   @return [Float]
            required :first_seen, Float

            # @!attribute last_seen
            #   Timestamp of last activity
            #
            #   @return [Float]
            required :last_seen, Float

            # @!attribute metadata
            #   Additional metadata provided by your system. We recommend including any relevant
            #   information that may assist in the moderation process.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Metadata]
            required :metadata, -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metadata }

            # @!attribute metrics
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Metrics]
            required :metrics, -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Metrics }

            # @!attribute risk_evaluation
            #   Risk assessment details, if available.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation, nil]
            required :risk_evaluation,
                     -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation },
                     nil?: true

            # @!attribute status
            #   Current author status
            #
            #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Status]
            required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::Status }

            # @!attribute trust_level
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel]
            required :trust_level, -> { ModerationAPI::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel }

            # @!attribute company
            #   The author's company or organization
            #
            #   @return [String, nil]
            optional :company, String, nil?: true

            # @!attribute email
            #   Author email address
            #
            #   @return [String, nil]
            optional :email, String, nil?: true

            # @!attribute external_id
            #   The author's ID from your system
            #
            #   @return [String, nil]
            optional :external_id, String, nil?: true

            # @!attribute external_link
            #   URL of the author's external profile
            #
            #   @return [String, nil]
            optional :external_link, String, nil?: true

            # @!attribute last_incident
            #   Timestamp of last incident
            #
            #   @return [Float, nil]
            optional :last_incident, Float, nil?: true

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

            # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
            #   Some parameter documentations has been truncated, see
            #   {ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object} for more
            #   details.
            #
            #   @param id [String] Author ID in Moderation API
            #
            #   @param block [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
            #
            #   @param first_seen [Float] Timestamp when author first appeared
            #
            #   @param last_seen [Float] Timestamp of last activity
            #
            #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Metadata] Additional metadata provided by your system. We recommend including any relevant
            #
            #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Metrics]
            #
            #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::RiskEvaluation, nil] Risk assessment details, if available.
            #
            #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Status] Current author status
            #
            #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::TrustLevel]
            #
            #   @param company [String, nil] The author's company or organization
            #
            #   @param email [String, nil] Author email address
            #
            #   @param external_id [String, nil] The author's ID from your system
            #
            #   @param external_link [String, nil] URL of the author's external profile
            #
            #   @param last_incident [Float, nil] Timestamp of last incident
            #
            #   @param name [String, nil] Author name or identifier
            #
            #   @param profile_picture [String, nil] URL of the author's profile picture

            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#block
            class Block < ModerationAPI::Internal::Type::BaseModel
              # @!attribute reason
              #   The moderators reason why the author was blocked or suspended.
              #
              #   @return [String, nil]
              optional :reason, String, nil?: true

              # @!attribute until_
              #   The timestamp until which they are blocked if the author is suspended.
              #
              #   @return [Float, nil]
              optional :until_, Float, api_name: :until, nil?: true

              # @!method initialize(reason: nil, until_: nil)
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
              #
              #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#metadata
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

            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#metrics
            class Metrics < ModerationAPI::Internal::Type::BaseModel
              # @!attribute flagged_content
              #   Number of flagged content pieces
              #
              #   @return [Float]
              required :flagged_content, Float

              # @!attribute total_content
              #   Total pieces of content
              #
              #   @return [Float]
              required :total_content, Float

              # @!attribute average_sentiment
              #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              #   project.
              #
              #   @return [Float, nil]
              optional :average_sentiment, Float, nil?: true

              # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object::Metrics} for
              #   more details.
              #
              #   @param flagged_content [Float] Number of flagged content pieces
              #
              #   @param total_content [Float] Total pieces of content
              #
              #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#risk_evaluation
            class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
              # @!attribute risk_level
              #   Calculated risk level based on more than 10 behavioral signals.
              #
              #   @return [Float, nil]
              optional :risk_level, Float, nil?: true

              # @!method initialize(risk_level: nil)
              #   Risk assessment details, if available.
              #
              #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
            end

            # Current author status
            #
            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#status
            module Status
              extend ModerationAPI::Internal::Type::Enum

              ENABLED = :enabled
              SUSPENDED = :suspended
              BLOCKED = :blocked

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorUpdated::Data::Object#trust_level
            class TrustLevel < ModerationAPI::Internal::Type::BaseModel
              # @!attribute level
              #   Author trust level (-1, 0, 1, 2, 3, or 4)
              #
              #   @return [Float]
              required :level, Float

              # @!attribute manual
              #   True if the trust level was set manually by a moderator
              #
              #   @return [Boolean]
              required :manual, ModerationAPI::Internal::Type::Boolean

              # @!method initialize(level:, manual:)
              #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
              #
              #   @param manual [Boolean] True if the trust level was set manually by a moderator
            end
          end
        end
      end

      class AuthorTrustLevelChanged < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.trust_level_changed"]
        required :type, const: :"author.trust_level_changed"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.trust_level_changed")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.trust_level_changed"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Author ID in Moderation API
            #
            #   @return [String]
            required :id, String

            # @!attribute block
            #   Block or suspension details, if applicable. Null if the author is enabled.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block, nil]
            required :block,
                     -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block },
                     nil?: true

            # @!attribute first_seen
            #   Timestamp when author first appeared
            #
            #   @return [Float]
            required :first_seen, Float

            # @!attribute last_seen
            #   Timestamp of last activity
            #
            #   @return [Float]
            required :last_seen, Float

            # @!attribute metadata
            #   Additional metadata provided by your system. We recommend including any relevant
            #   information that may assist in the moderation process.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata]
            required :metadata, -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata }

            # @!attribute metrics
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics]
            required :metrics, -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics }

            # @!attribute risk_evaluation
            #   Risk assessment details, if available.
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation, nil]
            required :risk_evaluation,
                     -> {
                       ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation
                     },
                     nil?: true

            # @!attribute status
            #   Current author status
            #
            #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status]
            required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status }

            # @!attribute trust_level
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel]
            required :trust_level,
                     -> { ModerationAPI::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel }

            # @!attribute company
            #   The author's company or organization
            #
            #   @return [String, nil]
            optional :company, String, nil?: true

            # @!attribute email
            #   Author email address
            #
            #   @return [String, nil]
            optional :email, String, nil?: true

            # @!attribute external_id
            #   The author's ID from your system
            #
            #   @return [String, nil]
            optional :external_id, String, nil?: true

            # @!attribute external_link
            #   URL of the author's external profile
            #
            #   @return [String, nil]
            optional :external_link, String, nil?: true

            # @!attribute last_incident
            #   Timestamp of last incident
            #
            #   @return [Float, nil]
            optional :last_incident, Float, nil?: true

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

            # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
            #   Some parameter documentations has been truncated, see
            #   {ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object} for
            #   more details.
            #
            #   @param id [String] Author ID in Moderation API
            #
            #   @param block [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
            #
            #   @param first_seen [Float] Timestamp when author first appeared
            #
            #   @param last_seen [Float] Timestamp of last activity
            #
            #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metadata] Additional metadata provided by your system. We recommend including any relevant
            #
            #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics]
            #
            #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::RiskEvaluation, nil] Risk assessment details, if available.
            #
            #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Status] Current author status
            #
            #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::TrustLevel]
            #
            #   @param company [String, nil] The author's company or organization
            #
            #   @param email [String, nil] Author email address
            #
            #   @param external_id [String, nil] The author's ID from your system
            #
            #   @param external_link [String, nil] URL of the author's external profile
            #
            #   @param last_incident [Float, nil] Timestamp of last incident
            #
            #   @param name [String, nil] Author name or identifier
            #
            #   @param profile_picture [String, nil] URL of the author's profile picture

            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#block
            class Block < ModerationAPI::Internal::Type::BaseModel
              # @!attribute reason
              #   The moderators reason why the author was blocked or suspended.
              #
              #   @return [String, nil]
              optional :reason, String, nil?: true

              # @!attribute until_
              #   The timestamp until which they are blocked if the author is suspended.
              #
              #   @return [Float, nil]
              optional :until_, Float, api_name: :until, nil?: true

              # @!method initialize(reason: nil, until_: nil)
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
              #
              #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#metadata
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

            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#metrics
            class Metrics < ModerationAPI::Internal::Type::BaseModel
              # @!attribute flagged_content
              #   Number of flagged content pieces
              #
              #   @return [Float]
              required :flagged_content, Float

              # @!attribute total_content
              #   Total pieces of content
              #
              #   @return [Float]
              required :total_content, Float

              # @!attribute average_sentiment
              #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              #   project.
              #
              #   @return [Float, nil]
              optional :average_sentiment, Float, nil?: true

              # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object::Metrics}
              #   for more details.
              #
              #   @param flagged_content [Float] Number of flagged content pieces
              #
              #   @param total_content [Float] Total pieces of content
              #
              #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#risk_evaluation
            class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
              # @!attribute risk_level
              #   Calculated risk level based on more than 10 behavioral signals.
              #
              #   @return [Float, nil]
              optional :risk_level, Float, nil?: true

              # @!method initialize(risk_level: nil)
              #   Risk assessment details, if available.
              #
              #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
            end

            # Current author status
            #
            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#status
            module Status
              extend ModerationAPI::Internal::Type::Enum

              ENABLED = :enabled
              SUSPENDED = :suspended
              BLOCKED = :blocked

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged::Data::Object#trust_level
            class TrustLevel < ModerationAPI::Internal::Type::BaseModel
              # @!attribute level
              #   Author trust level (-1, 0, 1, 2, 3, or 4)
              #
              #   @return [Float]
              required :level, Float

              # @!attribute manual
              #   True if the trust level was set manually by a moderator
              #
              #   @return [Boolean]
              required :manual, ModerationAPI::Internal::Type::Boolean

              # @!method initialize(level:, manual:)
              #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
              #
              #   @param manual [Boolean] True if the trust level was set manually by a moderator
            end
          end
        end
      end

      class AuthorAction < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data]
        required :data, -> { ModerationAPI::WebhookEvent::AuthorAction::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"author.action"]
        required :type, const: :"author.action"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"author.action")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::AuthorAction::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"author.action"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::AuthorAction#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute author
            #   The author the action was performed on
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author]
            required :author, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author }

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Queue }

            # @!method initialize(id:, author:, created_at:, key:, name:, value:, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author] The author the action was performed on
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Block, nil]
              required :block,
                       -> {
                         ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Block
                       },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel]
              required :trust_level, -> { ModerationAPI::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author} for
              #   more details.
              #
              #   The author the action was performed on
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::AuthorAction::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class QueueItemResolved < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data]
        required :data, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"queue_item.resolved"]
        required :type, const: :"queue_item.resolved"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"queue_item.resolved")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"queue_item.resolved"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute item
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item]
            required :item, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item }

            # @!attribute author
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author, nil]
            optional :author, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author }

            # @!attribute queue
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Queue }

            # @!method initialize(item:, author: nil, queue: nil)
            #   @param item [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item]
            #   @param author [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author]
            #   @param queue [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Queue]

            # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object#item
            class Item < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Content ID from your system
              #
              #   @return [String]
              required :id, String

              # @!attribute author_id
              #   External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @return [String, nil]
              required :author_id, String, nil?: true

              # @!attribute channel_key
              #   The channel the content was submitted to, identified by your customer-defined
              #   channel key.
              #
              #   @return [String, nil]
              required :channel_key, String, nil?: true

              # @!attribute content
              #   The original content payload
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object]
              required :content,
                       union: -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content }

              # @!attribute conversation_id
              #   Conversation grouping ID, if any
              #
              #   @return [String, nil]
              required :conversation_id, String, nil?: true

              # @!attribute flagged
              #   Whether the content was flagged by moderation
              #
              #   @return [Boolean, nil]
              required :flagged, ModerationAPI::Internal::Type::Boolean, nil?: true

              # @!attribute labels
              #   Moderation labels applied to the content
              #
              #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label>, nil]
              required :labels,
                       -> {
                         ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label]
                       },
                       nil?: true

              # @!attribute language
              #   Detected ISO language code, if available
              #
              #   @return [String, nil]
              required :language, String, nil?: true

              # @!attribute meta_type
              #   High-level content type (e.g. message, post, comment). Defaults to the channel's
              #   configured content type but can be overridden per request via the moderation API
              #   `type` field.
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType, nil]
              required :meta_type,
                       enum: -> {
                         ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType
                       },
                       nil?: true

              # @!attribute metadata
              #   Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :metadata,
                       ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown],
                       nil?: true

              # @!attribute timestamp
              #   ISO 8601 timestamp of when the content was submitted
              #
              #   @return [Time]
              required :timestamp, Time

              # @!method initialize(id:, author_id:, channel_key:, content:, conversation_id:, flagged:, labels:, language:, meta_type:, metadata:, timestamp:)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item} for
              #   more details.
              #
              #   @param id [String] Content ID from your system
              #
              #   @param author_id [String, nil] External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @param channel_key [String, nil] The channel the content was submitted to, identified by your customer-defined ch
              #
              #   @param content [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object] The original content payload
              #
              #   @param conversation_id [String, nil] Conversation grouping ID, if any
              #
              #   @param flagged [Boolean, nil] Whether the content was flagged by moderation
              #
              #   @param labels [Array<ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label>, nil] Moderation labels applied to the content
              #
              #   @param language [String, nil] Detected ISO language code, if available
              #
              #   @param meta_type [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::MetaType, nil] High-level content type (e.g. message, post, comment). Defaults to the channel's
              #
              #   @param metadata [Hash{Symbol=>Object}, nil] Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @param timestamp [Time] ISO 8601 timestamp of when the content was submitted

              # The original content payload
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item#content
              module Content
                extend ModerationAPI::Internal::Type::Union

                # Text
                variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text }

                # Image
                variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image }

                # Video
                variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video }

                # Audio
                variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio }

                # Object
                variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object }

                class Text < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute text
                  #   The content text
                  #
                  #   @return [String]
                  required :text, String

                  # @!attribute type
                  #
                  #   @return [Symbol, :text]
                  required :type, const: :text

                  # @!method initialize(text:, type: :text)
                  #   Text
                  #
                  #   @param text [String] The content text
                  #
                  #   @param type [Symbol, :text]
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :image]
                  required :type, const: :image

                  # @!attribute data
                  #   Base64-encoded image data. Either url or data must be provided. Note: base64
                  #   images are not stored and will not appear in the review queue.
                  #
                  #   @return [String, nil]
                  optional :data, String

                  # @!attribute url
                  #   A public URL of the image content. Either url or data must be provided.
                  #
                  #   @return [String, nil]
                  optional :url, String

                  # @!method initialize(data: nil, url: nil, type: :image)
                  #   Some parameter documentations has been truncated, see
                  #   {ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image}
                  #   for more details.
                  #
                  #   Image
                  #
                  #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                  #
                  #   @param url [String] A public URL of the image content. Either url or data must be provided.
                  #
                  #   @param type [Symbol, :image]
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :video]
                  required :type, const: :video

                  # @!attribute url
                  #   A public URL of the video content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :video)
                  #   Video
                  #
                  #   @param url [String] A public URL of the video content
                  #
                  #   @param type [Symbol, :video]
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :audio]
                  required :type, const: :audio

                  # @!attribute url
                  #   The URL of the audio content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :audio)
                  #   Audio
                  #
                  #   @param url [String] The URL of the audio content
                  #
                  #   @param type [Symbol, :audio]
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute data
                  #   Values in the object. Can be mixed content types.
                  #
                  #   @return [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio}]
                  required :data,
                           -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data] }

                  # @!attribute type
                  #
                  #   @return [Symbol, :object]
                  required :type, const: :object

                  # @!method initialize(data:, type: :object)
                  #   Object
                  #
                  #   @param data [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio}] Values in the object. Can be mixed content types.
                  #
                  #   @param type [Symbol, :object]

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    # Text
                    variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text }

                    # Image
                    variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image }

                    # Video
                    variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video }

                    # Audio
                    variant -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio }

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute text
                      #   The content text
                      #
                      #   @return [String]
                      required :text, String

                      # @!attribute type
                      #
                      #   @return [Symbol, :text]
                      required :type, const: :text

                      # @!method initialize(text:, type: :text)
                      #   Text
                      #
                      #   @param text [String] The content text
                      #
                      #   @param type [Symbol, :text]
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :image]
                      required :type, const: :image

                      # @!attribute data
                      #   Base64-encoded image data. Either url or data must be provided. Note: base64
                      #   images are not stored and will not appear in the review queue.
                      #
                      #   @return [String, nil]
                      optional :data, String

                      # @!attribute url
                      #   A public URL of the image content. Either url or data must be provided.
                      #
                      #   @return [String, nil]
                      optional :url, String

                      # @!method initialize(data: nil, url: nil, type: :image)
                      #   Some parameter documentations has been truncated, see
                      #   {ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image}
                      #   for more details.
                      #
                      #   Image
                      #
                      #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                      #
                      #   @param url [String] A public URL of the image content. Either url or data must be provided.
                      #
                      #   @param type [Symbol, :image]
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :video]
                      required :type, const: :video

                      # @!attribute url
                      #   A public URL of the video content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :video)
                      #   Video
                      #
                      #   @param url [String] A public URL of the video content
                      #
                      #   @param type [Symbol, :video]
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :audio]
                      required :type, const: :audio

                      # @!attribute url
                      #   The URL of the audio content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :audio)
                      #   Audio
                      #
                      #   @param url [String] The URL of the audio content
                      #
                      #   @param type [Symbol, :audio]
                    end

                    # @!method self.variants
                    #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object::Data::Audio)]
                  end
                end

                # @!method self.variants
                #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Content::Object)]
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                # @!attribute label
                #   The label name
                #
                #   @return [String]
                required :label, String

                # @!attribute score
                #   Confidence score between 0 and 1
                #
                #   @return [Float]
                required :score, Float

                # @!attribute flagged
                #   Whether this label crossed its flagging threshold
                #
                #   @return [Boolean, nil]
                optional :flagged, ModerationAPI::Internal::Type::Boolean

                # @!attribute manual
                #   True if the label was applied manually by a moderator
                #
                #   @return [Boolean, nil]
                optional :manual, ModerationAPI::Internal::Type::Boolean

                # @!attribute matches
                #
                #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match>, nil]
                optional :matches,
                         -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match] }

                # @!method initialize(label:, score:, flagged: nil, manual: nil, matches: nil)
                #   @param label [String] The label name
                #
                #   @param score [Float] Confidence score between 0 and 1
                #
                #   @param flagged [Boolean] Whether this label crossed its flagging threshold
                #
                #   @param manual [Boolean] True if the label was applied manually by a moderator
                #
                #   @param matches [Array<ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match>]

                class Match < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute match
                  #   The matched substring
                  #
                  #   @return [String]
                  required :match, String

                  # @!attribute probability
                  #   Match confidence between 0 and 1
                  #
                  #   @return [Float]
                  required :probability, Float

                  # @!attribute span
                  #   [start, end] character offsets in the source text
                  #
                  #   @return [Array<Object>]
                  required :span, ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Internal::Type::Unknown]

                  # @!attribute entity_type
                  #
                  #   @return [String, nil]
                  optional :entity_type, String

                  # @!attribute mask
                  #
                  #   @return [String, nil]
                  optional :mask, String, nil?: true

                  # @!attribute reasons
                  #
                  #   @return [Array<String>, nil]
                  optional :reasons, ModerationAPI::Internal::Type::ArrayOf[String]

                  # @!attribute signals
                  #
                  #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals, nil]
                  optional :signals,
                           -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals }

                  # @!method initialize(match:, probability:, span:, entity_type: nil, mask: nil, reasons: nil, signals: nil)
                  #   @param match [String] The matched substring
                  #
                  #   @param probability [Float] Match confidence between 0 and 1
                  #
                  #   @param span [Array<Object>] [start, end] character offsets in the source text
                  #
                  #   @param entity_type [String]
                  #
                  #   @param mask [String, nil]
                  #
                  #   @param reasons [Array<String>]
                  #
                  #   @param signals [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals]

                  # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match#signals
                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    # @!attribute bot_protection
                    #
                    #   @return [Boolean, nil]
                    required :bot_protection, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute brand_impersonation
                    #
                    #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    required :brand_impersonation,
                             -> {
                               ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                             },
                             nil?: true

                    # @!attribute domain_age_days
                    #
                    #   @return [Float, nil]
                    required :domain_age_days, Float, nil?: true

                    # @!attribute final_url
                    #
                    #   @return [String, nil]
                    required :final_url, String, nil?: true

                    # @!attribute has_email_setup
                    #
                    #   @return [Boolean, nil]
                    required :has_email_setup, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute has_suspicious_characters
                    #
                    #   @return [Boolean]
                    required :has_suspicious_characters, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_link_shortener
                    #
                    #   @return [Boolean]
                    required :is_link_shortener, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_reported
                    #
                    #   @return [Boolean]
                    required :is_reported, ModerationAPI::Internal::Type::Boolean

                    # @!attribute redirect_count
                    #
                    #   @return [Float, nil]
                    required :redirect_count, Float, nil?: true

                    # @!method initialize(bot_protection:, brand_impersonation:, domain_age_days:, final_url:, has_email_setup:, has_suspicious_characters:, is_link_shortener:, is_reported:, redirect_count:)
                    #   @param bot_protection [Boolean, nil]
                    #   @param brand_impersonation [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    #   @param domain_age_days [Float, nil]
                    #   @param final_url [String, nil]
                    #   @param has_email_setup [Boolean, nil]
                    #   @param has_suspicious_characters [Boolean]
                    #   @param is_link_shortener [Boolean]
                    #   @param is_reported [Boolean]
                    #   @param redirect_count [Float, nil]

                    # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item::Label::Match::Signals#brand_impersonation
                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute brand
                      #
                      #   @return [String]
                      required :brand, String

                      # @!attribute method_
                      #
                      #   @return [String]
                      required :method_, String, api_name: :method

                      # @!method initialize(brand:, method_:)
                      #   @param brand [String]
                      #   @param method_ [String]
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Item#meta_type
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                PROFILE = :profile
                MESSAGE = :message
                POST = :post
                COMMENT = :comment
                EVENT = :event
                PRODUCT = :product
                REVIEW = :review
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Status]
              required :status,
                       enum: -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author}
              #   for more details.
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemResolved::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   @param id [String]
            end
          end
        end
      end

      class QueueItemAction < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data]
        required :data, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"queue_item.action"]
        required :type, const: :"queue_item.action"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"queue_item.action")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"queue_item.action"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::QueueItemAction#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute author
            #   The author the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author, nil]
            optional :author, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author }

            # @!attribute item
            #   The content item the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item, nil]
            optional :item, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item }

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Queue }

            # @!method initialize(id:, created_at:, key:, name:, value:, author: nil, item: nil, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author] The author the action was performed on, if any
            #
            #   @param item [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item] The content item the action was performed on, if any
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author} for
              #   more details.
              #
              #   The author the action was performed on, if any
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object#item
            class Item < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Content ID from your system
              #
              #   @return [String]
              required :id, String

              # @!attribute author_id
              #   External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @return [String, nil]
              required :author_id, String, nil?: true

              # @!attribute channel_key
              #   The channel the content was submitted to, identified by your customer-defined
              #   channel key.
              #
              #   @return [String, nil]
              required :channel_key, String, nil?: true

              # @!attribute content
              #   The original content payload
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object]
              required :content, union: -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content }

              # @!attribute conversation_id
              #   Conversation grouping ID, if any
              #
              #   @return [String, nil]
              required :conversation_id, String, nil?: true

              # @!attribute flagged
              #   Whether the content was flagged by moderation
              #
              #   @return [Boolean, nil]
              required :flagged, ModerationAPI::Internal::Type::Boolean, nil?: true

              # @!attribute labels
              #   Moderation labels applied to the content
              #
              #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label>, nil]
              required :labels,
                       -> {
                         ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label]
                       },
                       nil?: true

              # @!attribute language
              #   Detected ISO language code, if available
              #
              #   @return [String, nil]
              required :language, String, nil?: true

              # @!attribute meta_type
              #   High-level content type (e.g. message, post, comment). Defaults to the channel's
              #   configured content type but can be overridden per request via the moderation API
              #   `type` field.
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType, nil]
              required :meta_type,
                       enum: -> {
                         ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType
                       },
                       nil?: true

              # @!attribute metadata
              #   Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :metadata,
                       ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown],
                       nil?: true

              # @!attribute timestamp
              #   ISO 8601 timestamp of when the content was submitted
              #
              #   @return [Time]
              required :timestamp, Time

              # @!method initialize(id:, author_id:, channel_key:, content:, conversation_id:, flagged:, labels:, language:, meta_type:, metadata:, timestamp:)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item} for
              #   more details.
              #
              #   The content item the action was performed on, if any
              #
              #   @param id [String] Content ID from your system
              #
              #   @param author_id [String, nil] External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @param channel_key [String, nil] The channel the content was submitted to, identified by your customer-defined ch
              #
              #   @param content [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object] The original content payload
              #
              #   @param conversation_id [String, nil] Conversation grouping ID, if any
              #
              #   @param flagged [Boolean, nil] Whether the content was flagged by moderation
              #
              #   @param labels [Array<ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label>, nil] Moderation labels applied to the content
              #
              #   @param language [String, nil] Detected ISO language code, if available
              #
              #   @param meta_type [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::MetaType, nil] High-level content type (e.g. message, post, comment). Defaults to the channel's
              #
              #   @param metadata [Hash{Symbol=>Object}, nil] Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @param timestamp [Time] ISO 8601 timestamp of when the content was submitted

              # The original content payload
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item#content
              module Content
                extend ModerationAPI::Internal::Type::Union

                # Text
                variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text }

                # Image
                variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image }

                # Video
                variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video }

                # Audio
                variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio }

                # Object
                variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object }

                class Text < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute text
                  #   The content text
                  #
                  #   @return [String]
                  required :text, String

                  # @!attribute type
                  #
                  #   @return [Symbol, :text]
                  required :type, const: :text

                  # @!method initialize(text:, type: :text)
                  #   Text
                  #
                  #   @param text [String] The content text
                  #
                  #   @param type [Symbol, :text]
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :image]
                  required :type, const: :image

                  # @!attribute data
                  #   Base64-encoded image data. Either url or data must be provided. Note: base64
                  #   images are not stored and will not appear in the review queue.
                  #
                  #   @return [String, nil]
                  optional :data, String

                  # @!attribute url
                  #   A public URL of the image content. Either url or data must be provided.
                  #
                  #   @return [String, nil]
                  optional :url, String

                  # @!method initialize(data: nil, url: nil, type: :image)
                  #   Some parameter documentations has been truncated, see
                  #   {ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image}
                  #   for more details.
                  #
                  #   Image
                  #
                  #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                  #
                  #   @param url [String] A public URL of the image content. Either url or data must be provided.
                  #
                  #   @param type [Symbol, :image]
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :video]
                  required :type, const: :video

                  # @!attribute url
                  #   A public URL of the video content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :video)
                  #   Video
                  #
                  #   @param url [String] A public URL of the video content
                  #
                  #   @param type [Symbol, :video]
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :audio]
                  required :type, const: :audio

                  # @!attribute url
                  #   The URL of the audio content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :audio)
                  #   Audio
                  #
                  #   @param url [String] The URL of the audio content
                  #
                  #   @param type [Symbol, :audio]
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute data
                  #   Values in the object. Can be mixed content types.
                  #
                  #   @return [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio}]
                  required :data,
                           -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data] }

                  # @!attribute type
                  #
                  #   @return [Symbol, :object]
                  required :type, const: :object

                  # @!method initialize(data:, type: :object)
                  #   Object
                  #
                  #   @param data [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio}] Values in the object. Can be mixed content types.
                  #
                  #   @param type [Symbol, :object]

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    # Text
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text }

                    # Image
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image }

                    # Video
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video }

                    # Audio
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio }

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute text
                      #   The content text
                      #
                      #   @return [String]
                      required :text, String

                      # @!attribute type
                      #
                      #   @return [Symbol, :text]
                      required :type, const: :text

                      # @!method initialize(text:, type: :text)
                      #   Text
                      #
                      #   @param text [String] The content text
                      #
                      #   @param type [Symbol, :text]
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :image]
                      required :type, const: :image

                      # @!attribute data
                      #   Base64-encoded image data. Either url or data must be provided. Note: base64
                      #   images are not stored and will not appear in the review queue.
                      #
                      #   @return [String, nil]
                      optional :data, String

                      # @!attribute url
                      #   A public URL of the image content. Either url or data must be provided.
                      #
                      #   @return [String, nil]
                      optional :url, String

                      # @!method initialize(data: nil, url: nil, type: :image)
                      #   Some parameter documentations has been truncated, see
                      #   {ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image}
                      #   for more details.
                      #
                      #   Image
                      #
                      #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                      #
                      #   @param url [String] A public URL of the image content. Either url or data must be provided.
                      #
                      #   @param type [Symbol, :image]
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :video]
                      required :type, const: :video

                      # @!attribute url
                      #   A public URL of the video content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :video)
                      #   Video
                      #
                      #   @param url [String] A public URL of the video content
                      #
                      #   @param type [Symbol, :video]
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :audio]
                      required :type, const: :audio

                      # @!attribute url
                      #   The URL of the audio content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :audio)
                      #   Audio
                      #
                      #   @param url [String] The URL of the audio content
                      #
                      #   @param type [Symbol, :audio]
                    end

                    # @!method self.variants
                    #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object::Data::Audio)]
                  end
                end

                # @!method self.variants
                #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Content::Object)]
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                # @!attribute label
                #   The label name
                #
                #   @return [String]
                required :label, String

                # @!attribute score
                #   Confidence score between 0 and 1
                #
                #   @return [Float]
                required :score, Float

                # @!attribute flagged
                #   Whether this label crossed its flagging threshold
                #
                #   @return [Boolean, nil]
                optional :flagged, ModerationAPI::Internal::Type::Boolean

                # @!attribute manual
                #   True if the label was applied manually by a moderator
                #
                #   @return [Boolean, nil]
                optional :manual, ModerationAPI::Internal::Type::Boolean

                # @!attribute matches
                #
                #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match>, nil]
                optional :matches,
                         -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match] }

                # @!method initialize(label:, score:, flagged: nil, manual: nil, matches: nil)
                #   @param label [String] The label name
                #
                #   @param score [Float] Confidence score between 0 and 1
                #
                #   @param flagged [Boolean] Whether this label crossed its flagging threshold
                #
                #   @param manual [Boolean] True if the label was applied manually by a moderator
                #
                #   @param matches [Array<ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match>]

                class Match < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute match
                  #   The matched substring
                  #
                  #   @return [String]
                  required :match, String

                  # @!attribute probability
                  #   Match confidence between 0 and 1
                  #
                  #   @return [Float]
                  required :probability, Float

                  # @!attribute span
                  #   [start, end] character offsets in the source text
                  #
                  #   @return [Array<Object>]
                  required :span, ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Internal::Type::Unknown]

                  # @!attribute entity_type
                  #
                  #   @return [String, nil]
                  optional :entity_type, String

                  # @!attribute mask
                  #
                  #   @return [String, nil]
                  optional :mask, String, nil?: true

                  # @!attribute reasons
                  #
                  #   @return [Array<String>, nil]
                  optional :reasons, ModerationAPI::Internal::Type::ArrayOf[String]

                  # @!attribute signals
                  #
                  #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals, nil]
                  optional :signals,
                           -> { ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals }

                  # @!method initialize(match:, probability:, span:, entity_type: nil, mask: nil, reasons: nil, signals: nil)
                  #   @param match [String] The matched substring
                  #
                  #   @param probability [Float] Match confidence between 0 and 1
                  #
                  #   @param span [Array<Object>] [start, end] character offsets in the source text
                  #
                  #   @param entity_type [String]
                  #
                  #   @param mask [String, nil]
                  #
                  #   @param reasons [Array<String>]
                  #
                  #   @param signals [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals]

                  # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match#signals
                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    # @!attribute bot_protection
                    #
                    #   @return [Boolean, nil]
                    required :bot_protection, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute brand_impersonation
                    #
                    #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    required :brand_impersonation,
                             -> {
                               ModerationAPI::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                             },
                             nil?: true

                    # @!attribute domain_age_days
                    #
                    #   @return [Float, nil]
                    required :domain_age_days, Float, nil?: true

                    # @!attribute final_url
                    #
                    #   @return [String, nil]
                    required :final_url, String, nil?: true

                    # @!attribute has_email_setup
                    #
                    #   @return [Boolean, nil]
                    required :has_email_setup, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute has_suspicious_characters
                    #
                    #   @return [Boolean]
                    required :has_suspicious_characters, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_link_shortener
                    #
                    #   @return [Boolean]
                    required :is_link_shortener, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_reported
                    #
                    #   @return [Boolean]
                    required :is_reported, ModerationAPI::Internal::Type::Boolean

                    # @!attribute redirect_count
                    #
                    #   @return [Float, nil]
                    required :redirect_count, Float, nil?: true

                    # @!method initialize(bot_protection:, brand_impersonation:, domain_age_days:, final_url:, has_email_setup:, has_suspicious_characters:, is_link_shortener:, is_reported:, redirect_count:)
                    #   @param bot_protection [Boolean, nil]
                    #   @param brand_impersonation [ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    #   @param domain_age_days [Float, nil]
                    #   @param final_url [String, nil]
                    #   @param has_email_setup [Boolean, nil]
                    #   @param has_suspicious_characters [Boolean]
                    #   @param is_link_shortener [Boolean]
                    #   @param is_reported [Boolean]
                    #   @param redirect_count [Float, nil]

                    # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item::Label::Match::Signals#brand_impersonation
                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute brand
                      #
                      #   @return [String]
                      required :brand, String

                      # @!attribute method_
                      #
                      #   @return [String]
                      required :method_, String, api_name: :method

                      # @!method initialize(brand:, method_:)
                      #   @param brand [String]
                      #   @param method_ [String]
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object::Item#meta_type
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                PROFILE = :profile
                MESSAGE = :message
                POST = :post
                COMMENT = :comment
                EVENT = :event
                PRODUCT = :product
                REVIEW = :review
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAction::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class QueueItemRejected < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data]
        required :data, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"queue_item.rejected"]
        required :type, const: :"queue_item.rejected"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"queue_item.rejected")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"queue_item.rejected"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute author
            #   The author the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author, nil]
            optional :author, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author }

            # @!attribute item
            #   The content item the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item, nil]
            optional :item, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item }

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Queue }

            # @!method initialize(id:, created_at:, key:, name:, value:, author: nil, item: nil, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author] The author the action was performed on, if any
            #
            #   @param item [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item] The content item the action was performed on, if any
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Status]
              required :status,
                       enum: -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author}
              #   for more details.
              #
              #   The author the action was performed on, if any
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object#item
            class Item < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Content ID from your system
              #
              #   @return [String]
              required :id, String

              # @!attribute author_id
              #   External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @return [String, nil]
              required :author_id, String, nil?: true

              # @!attribute channel_key
              #   The channel the content was submitted to, identified by your customer-defined
              #   channel key.
              #
              #   @return [String, nil]
              required :channel_key, String, nil?: true

              # @!attribute content
              #   The original content payload
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object]
              required :content,
                       union: -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content }

              # @!attribute conversation_id
              #   Conversation grouping ID, if any
              #
              #   @return [String, nil]
              required :conversation_id, String, nil?: true

              # @!attribute flagged
              #   Whether the content was flagged by moderation
              #
              #   @return [Boolean, nil]
              required :flagged, ModerationAPI::Internal::Type::Boolean, nil?: true

              # @!attribute labels
              #   Moderation labels applied to the content
              #
              #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label>, nil]
              required :labels,
                       -> {
                         ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label]
                       },
                       nil?: true

              # @!attribute language
              #   Detected ISO language code, if available
              #
              #   @return [String, nil]
              required :language, String, nil?: true

              # @!attribute meta_type
              #   High-level content type (e.g. message, post, comment). Defaults to the channel's
              #   configured content type but can be overridden per request via the moderation API
              #   `type` field.
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType, nil]
              required :meta_type,
                       enum: -> {
                         ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType
                       },
                       nil?: true

              # @!attribute metadata
              #   Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :metadata,
                       ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown],
                       nil?: true

              # @!attribute timestamp
              #   ISO 8601 timestamp of when the content was submitted
              #
              #   @return [Time]
              required :timestamp, Time

              # @!method initialize(id:, author_id:, channel_key:, content:, conversation_id:, flagged:, labels:, language:, meta_type:, metadata:, timestamp:)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item} for
              #   more details.
              #
              #   The content item the action was performed on, if any
              #
              #   @param id [String] Content ID from your system
              #
              #   @param author_id [String, nil] External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @param channel_key [String, nil] The channel the content was submitted to, identified by your customer-defined ch
              #
              #   @param content [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object] The original content payload
              #
              #   @param conversation_id [String, nil] Conversation grouping ID, if any
              #
              #   @param flagged [Boolean, nil] Whether the content was flagged by moderation
              #
              #   @param labels [Array<ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label>, nil] Moderation labels applied to the content
              #
              #   @param language [String, nil] Detected ISO language code, if available
              #
              #   @param meta_type [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::MetaType, nil] High-level content type (e.g. message, post, comment). Defaults to the channel's
              #
              #   @param metadata [Hash{Symbol=>Object}, nil] Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @param timestamp [Time] ISO 8601 timestamp of when the content was submitted

              # The original content payload
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item#content
              module Content
                extend ModerationAPI::Internal::Type::Union

                # Text
                variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text }

                # Image
                variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image }

                # Video
                variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video }

                # Audio
                variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio }

                # Object
                variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object }

                class Text < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute text
                  #   The content text
                  #
                  #   @return [String]
                  required :text, String

                  # @!attribute type
                  #
                  #   @return [Symbol, :text]
                  required :type, const: :text

                  # @!method initialize(text:, type: :text)
                  #   Text
                  #
                  #   @param text [String] The content text
                  #
                  #   @param type [Symbol, :text]
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :image]
                  required :type, const: :image

                  # @!attribute data
                  #   Base64-encoded image data. Either url or data must be provided. Note: base64
                  #   images are not stored and will not appear in the review queue.
                  #
                  #   @return [String, nil]
                  optional :data, String

                  # @!attribute url
                  #   A public URL of the image content. Either url or data must be provided.
                  #
                  #   @return [String, nil]
                  optional :url, String

                  # @!method initialize(data: nil, url: nil, type: :image)
                  #   Some parameter documentations has been truncated, see
                  #   {ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image}
                  #   for more details.
                  #
                  #   Image
                  #
                  #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                  #
                  #   @param url [String] A public URL of the image content. Either url or data must be provided.
                  #
                  #   @param type [Symbol, :image]
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :video]
                  required :type, const: :video

                  # @!attribute url
                  #   A public URL of the video content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :video)
                  #   Video
                  #
                  #   @param url [String] A public URL of the video content
                  #
                  #   @param type [Symbol, :video]
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :audio]
                  required :type, const: :audio

                  # @!attribute url
                  #   The URL of the audio content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :audio)
                  #   Audio
                  #
                  #   @param url [String] The URL of the audio content
                  #
                  #   @param type [Symbol, :audio]
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute data
                  #   Values in the object. Can be mixed content types.
                  #
                  #   @return [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio}]
                  required :data,
                           -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data] }

                  # @!attribute type
                  #
                  #   @return [Symbol, :object]
                  required :type, const: :object

                  # @!method initialize(data:, type: :object)
                  #   Object
                  #
                  #   @param data [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio}] Values in the object. Can be mixed content types.
                  #
                  #   @param type [Symbol, :object]

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    # Text
                    variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text }

                    # Image
                    variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image }

                    # Video
                    variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video }

                    # Audio
                    variant -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio }

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute text
                      #   The content text
                      #
                      #   @return [String]
                      required :text, String

                      # @!attribute type
                      #
                      #   @return [Symbol, :text]
                      required :type, const: :text

                      # @!method initialize(text:, type: :text)
                      #   Text
                      #
                      #   @param text [String] The content text
                      #
                      #   @param type [Symbol, :text]
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :image]
                      required :type, const: :image

                      # @!attribute data
                      #   Base64-encoded image data. Either url or data must be provided. Note: base64
                      #   images are not stored and will not appear in the review queue.
                      #
                      #   @return [String, nil]
                      optional :data, String

                      # @!attribute url
                      #   A public URL of the image content. Either url or data must be provided.
                      #
                      #   @return [String, nil]
                      optional :url, String

                      # @!method initialize(data: nil, url: nil, type: :image)
                      #   Some parameter documentations has been truncated, see
                      #   {ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image}
                      #   for more details.
                      #
                      #   Image
                      #
                      #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                      #
                      #   @param url [String] A public URL of the image content. Either url or data must be provided.
                      #
                      #   @param type [Symbol, :image]
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :video]
                      required :type, const: :video

                      # @!attribute url
                      #   A public URL of the video content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :video)
                      #   Video
                      #
                      #   @param url [String] A public URL of the video content
                      #
                      #   @param type [Symbol, :video]
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :audio]
                      required :type, const: :audio

                      # @!attribute url
                      #   The URL of the audio content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :audio)
                      #   Audio
                      #
                      #   @param url [String] The URL of the audio content
                      #
                      #   @param type [Symbol, :audio]
                    end

                    # @!method self.variants
                    #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object::Data::Audio)]
                  end
                end

                # @!method self.variants
                #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Content::Object)]
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                # @!attribute label
                #   The label name
                #
                #   @return [String]
                required :label, String

                # @!attribute score
                #   Confidence score between 0 and 1
                #
                #   @return [Float]
                required :score, Float

                # @!attribute flagged
                #   Whether this label crossed its flagging threshold
                #
                #   @return [Boolean, nil]
                optional :flagged, ModerationAPI::Internal::Type::Boolean

                # @!attribute manual
                #   True if the label was applied manually by a moderator
                #
                #   @return [Boolean, nil]
                optional :manual, ModerationAPI::Internal::Type::Boolean

                # @!attribute matches
                #
                #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match>, nil]
                optional :matches,
                         -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match] }

                # @!method initialize(label:, score:, flagged: nil, manual: nil, matches: nil)
                #   @param label [String] The label name
                #
                #   @param score [Float] Confidence score between 0 and 1
                #
                #   @param flagged [Boolean] Whether this label crossed its flagging threshold
                #
                #   @param manual [Boolean] True if the label was applied manually by a moderator
                #
                #   @param matches [Array<ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match>]

                class Match < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute match
                  #   The matched substring
                  #
                  #   @return [String]
                  required :match, String

                  # @!attribute probability
                  #   Match confidence between 0 and 1
                  #
                  #   @return [Float]
                  required :probability, Float

                  # @!attribute span
                  #   [start, end] character offsets in the source text
                  #
                  #   @return [Array<Object>]
                  required :span, ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Internal::Type::Unknown]

                  # @!attribute entity_type
                  #
                  #   @return [String, nil]
                  optional :entity_type, String

                  # @!attribute mask
                  #
                  #   @return [String, nil]
                  optional :mask, String, nil?: true

                  # @!attribute reasons
                  #
                  #   @return [Array<String>, nil]
                  optional :reasons, ModerationAPI::Internal::Type::ArrayOf[String]

                  # @!attribute signals
                  #
                  #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals, nil]
                  optional :signals,
                           -> { ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals }

                  # @!method initialize(match:, probability:, span:, entity_type: nil, mask: nil, reasons: nil, signals: nil)
                  #   @param match [String] The matched substring
                  #
                  #   @param probability [Float] Match confidence between 0 and 1
                  #
                  #   @param span [Array<Object>] [start, end] character offsets in the source text
                  #
                  #   @param entity_type [String]
                  #
                  #   @param mask [String, nil]
                  #
                  #   @param reasons [Array<String>]
                  #
                  #   @param signals [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals]

                  # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match#signals
                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    # @!attribute bot_protection
                    #
                    #   @return [Boolean, nil]
                    required :bot_protection, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute brand_impersonation
                    #
                    #   @return [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    required :brand_impersonation,
                             -> {
                               ModerationAPI::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                             },
                             nil?: true

                    # @!attribute domain_age_days
                    #
                    #   @return [Float, nil]
                    required :domain_age_days, Float, nil?: true

                    # @!attribute final_url
                    #
                    #   @return [String, nil]
                    required :final_url, String, nil?: true

                    # @!attribute has_email_setup
                    #
                    #   @return [Boolean, nil]
                    required :has_email_setup, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute has_suspicious_characters
                    #
                    #   @return [Boolean]
                    required :has_suspicious_characters, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_link_shortener
                    #
                    #   @return [Boolean]
                    required :is_link_shortener, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_reported
                    #
                    #   @return [Boolean]
                    required :is_reported, ModerationAPI::Internal::Type::Boolean

                    # @!attribute redirect_count
                    #
                    #   @return [Float, nil]
                    required :redirect_count, Float, nil?: true

                    # @!method initialize(bot_protection:, brand_impersonation:, domain_age_days:, final_url:, has_email_setup:, has_suspicious_characters:, is_link_shortener:, is_reported:, redirect_count:)
                    #   @param bot_protection [Boolean, nil]
                    #   @param brand_impersonation [ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    #   @param domain_age_days [Float, nil]
                    #   @param final_url [String, nil]
                    #   @param has_email_setup [Boolean, nil]
                    #   @param has_suspicious_characters [Boolean]
                    #   @param is_link_shortener [Boolean]
                    #   @param is_reported [Boolean]
                    #   @param redirect_count [Float, nil]

                    # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item::Label::Match::Signals#brand_impersonation
                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute brand
                      #
                      #   @return [String]
                      required :brand, String

                      # @!attribute method_
                      #
                      #   @return [String]
                      required :method_, String, api_name: :method

                      # @!method initialize(brand:, method_:)
                      #   @param brand [String]
                      #   @param method_ [String]
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object::Item#meta_type
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                PROFILE = :profile
                MESSAGE = :message
                POST = :post
                COMMENT = :comment
                EVENT = :event
                PRODUCT = :product
                REVIEW = :review
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemRejected::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      class QueueItemAllowed < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   Stable event ID. Use this to dedupe retries.
        #
        #   @return [String]
        required :id, String

        # @!attribute api_version
        #
        #   @return [Symbol, :v2]
        required :api_version, const: :v2

        # @!attribute created
        #   ISO 8601 timestamp of when the event was emitted.
        #
        #   @return [Time]
        required :created, Time

        # @!attribute data
        #
        #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data]
        required :data, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data }

        # @!attribute type
        #   The event type.
        #
        #   @return [Symbol, :"queue_item.allowed"]
        required :type, const: :"queue_item.allowed"

        # @!method initialize(id:, created:, data:, api_version: :v2, type: :"queue_item.allowed")
        #   @param id [String] Stable event ID. Use this to dedupe retries.
        #
        #   @param created [Time] ISO 8601 timestamp of when the event was emitted.
        #
        #   @param data [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data]
        #
        #   @param api_version [Symbol, :v2]
        #
        #   @param type [Symbol, :"queue_item.allowed"] The event type.

        # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed#data
        class Data < ModerationAPI::Internal::Type::BaseModel
          # @!attribute object
          #
          #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object]
          required :object, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object }

          # @!method initialize(object:)
          #   @param object [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object]

          # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data#object
          class Object < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Moderation action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   ISO 8601 timestamp of when the action was performed
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute key
            #   Customer-defined key identifying this action
            #
            #   @return [String, nil]
            required :key, String, nil?: true

            # @!attribute name
            #   Display name of the action
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!attribute value
            #   The value passed to the action when it ran
            #
            #   @return [String, nil]
            required :value, String, nil?: true

            # @!attribute author
            #   The author the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author, nil]
            optional :author, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author }

            # @!attribute item
            #   The content item the action was performed on, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item, nil]
            optional :item, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item }

            # @!attribute queue
            #   The queue the item belongs to, if any
            #
            #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Queue, nil]
            optional :queue, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Queue }

            # @!method initialize(id:, created_at:, key:, name:, value:, author: nil, item: nil, queue: nil)
            #   @param id [String] Moderation action ID
            #
            #   @param created_at [Time] ISO 8601 timestamp of when the action was performed
            #
            #   @param key [String, nil] Customer-defined key identifying this action
            #
            #   @param name [String, nil] Display name of the action
            #
            #   @param value [String, nil] The value passed to the action when it ran
            #
            #   @param author [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author] The author the action was performed on, if any
            #
            #   @param item [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item] The content item the action was performed on, if any
            #
            #   @param queue [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Queue] The queue the item belongs to, if any

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object#author
            class Author < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Author ID in Moderation API
              #
              #   @return [String]
              required :id, String

              # @!attribute block
              #   Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block, nil]
              required :block,
                       -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block },
                       nil?: true

              # @!attribute first_seen
              #   Timestamp when author first appeared
              #
              #   @return [Float]
              required :first_seen, Float

              # @!attribute last_seen
              #   Timestamp of last activity
              #
              #   @return [Float]
              required :last_seen, Float

              # @!attribute metadata
              #   Additional metadata provided by your system. We recommend including any relevant
              #   information that may assist in the moderation process.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata]
              required :metadata, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata }

              # @!attribute metrics
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics]
              required :metrics, -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics }

              # @!attribute risk_evaluation
              #   Risk assessment details, if available.
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation, nil]
              required :risk_evaluation,
                       -> {
                         ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation
                       },
                       nil?: true

              # @!attribute status
              #   Current author status
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status]
              required :status, enum: -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status }

              # @!attribute trust_level
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel]
              required :trust_level,
                       -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel }

              # @!attribute company
              #   The author's company or organization
              #
              #   @return [String, nil]
              optional :company, String, nil?: true

              # @!attribute email
              #   Author email address
              #
              #   @return [String, nil]
              optional :email, String, nil?: true

              # @!attribute external_id
              #   The author's ID from your system
              #
              #   @return [String, nil]
              optional :external_id, String, nil?: true

              # @!attribute external_link
              #   URL of the author's external profile
              #
              #   @return [String, nil]
              optional :external_link, String, nil?: true

              # @!attribute last_incident
              #   Timestamp of last incident
              #
              #   @return [Float, nil]
              optional :last_incident, Float, nil?: true

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

              # @!method initialize(id:, block:, first_seen:, last_seen:, metadata:, metrics:, risk_evaluation:, status:, trust_level:, company: nil, email: nil, external_id: nil, external_link: nil, last_incident: nil, name: nil, profile_picture: nil)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author}
              #   for more details.
              #
              #   The author the action was performed on, if any
              #
              #   @param id [String] Author ID in Moderation API
              #
              #   @param block [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Block, nil] Block or suspension details, if applicable. Null if the author is enabled.
              #
              #   @param first_seen [Float] Timestamp when author first appeared
              #
              #   @param last_seen [Float] Timestamp of last activity
              #
              #   @param metadata [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metadata] Additional metadata provided by your system. We recommend including any relevant
              #
              #   @param metrics [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics]
              #
              #   @param risk_evaluation [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::RiskEvaluation, nil] Risk assessment details, if available.
              #
              #   @param status [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Status] Current author status
              #
              #   @param trust_level [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::TrustLevel]
              #
              #   @param company [String, nil] The author's company or organization
              #
              #   @param email [String, nil] Author email address
              #
              #   @param external_id [String, nil] The author's ID from your system
              #
              #   @param external_link [String, nil] URL of the author's external profile
              #
              #   @param last_incident [Float, nil] Timestamp of last incident
              #
              #   @param name [String, nil] Author name or identifier
              #
              #   @param profile_picture [String, nil] URL of the author's profile picture

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#block
              class Block < ModerationAPI::Internal::Type::BaseModel
                # @!attribute reason
                #   The moderators reason why the author was blocked or suspended.
                #
                #   @return [String, nil]
                optional :reason, String, nil?: true

                # @!attribute until_
                #   The timestamp until which they are blocked if the author is suspended.
                #
                #   @return [Float, nil]
                optional :until_, Float, api_name: :until, nil?: true

                # @!method initialize(reason: nil, until_: nil)
                #   Block or suspension details, if applicable. Null if the author is enabled.
                #
                #   @param reason [String, nil] The moderators reason why the author was blocked or suspended.
                #
                #   @param until_ [Float, nil] The timestamp until which they are blocked if the author is suspended.
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#metadata
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

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#metrics
              class Metrics < ModerationAPI::Internal::Type::BaseModel
                # @!attribute flagged_content
                #   Number of flagged content pieces
                #
                #   @return [Float]
                required :flagged_content, Float

                # @!attribute total_content
                #   Total pieces of content
                #
                #   @return [Float]
                required :total_content, Float

                # @!attribute average_sentiment
                #   Average sentiment score of content (-1 to 1). Requires a sentiment model in your
                #   project.
                #
                #   @return [Float, nil]
                optional :average_sentiment, Float, nil?: true

                # @!method initialize(flagged_content:, total_content:, average_sentiment: nil)
                #   Some parameter documentations has been truncated, see
                #   {ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author::Metrics}
                #   for more details.
                #
                #   @param flagged_content [Float] Number of flagged content pieces
                #
                #   @param total_content [Float] Total pieces of content
                #
                #   @param average_sentiment [Float, nil] Average sentiment score of content (-1 to 1). Requires a sentiment model in your
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#risk_evaluation
              class RiskEvaluation < ModerationAPI::Internal::Type::BaseModel
                # @!attribute risk_level
                #   Calculated risk level based on more than 10 behavioral signals.
                #
                #   @return [Float, nil]
                optional :risk_level, Float, nil?: true

                # @!method initialize(risk_level: nil)
                #   Risk assessment details, if available.
                #
                #   @param risk_level [Float, nil] Calculated risk level based on more than 10 behavioral signals.
              end

              # Current author status
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#status
              module Status
                extend ModerationAPI::Internal::Type::Enum

                ENABLED = :enabled
                SUSPENDED = :suspended
                BLOCKED = :blocked

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Author#trust_level
              class TrustLevel < ModerationAPI::Internal::Type::BaseModel
                # @!attribute level
                #   Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @return [Float]
                required :level, Float

                # @!attribute manual
                #   True if the trust level was set manually by a moderator
                #
                #   @return [Boolean]
                required :manual, ModerationAPI::Internal::Type::Boolean

                # @!method initialize(level:, manual:)
                #   @param level [Float] Author trust level (-1, 0, 1, 2, 3, or 4)
                #
                #   @param manual [Boolean] True if the trust level was set manually by a moderator
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object#item
            class Item < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #   Content ID from your system
              #
              #   @return [String]
              required :id, String

              # @!attribute author_id
              #   External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @return [String, nil]
              required :author_id, String, nil?: true

              # @!attribute channel_key
              #   The channel the content was submitted to, identified by your customer-defined
              #   channel key.
              #
              #   @return [String, nil]
              required :channel_key, String, nil?: true

              # @!attribute content
              #   The original content payload
              #
              #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object]
              required :content,
                       union: -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content }

              # @!attribute conversation_id
              #   Conversation grouping ID, if any
              #
              #   @return [String, nil]
              required :conversation_id, String, nil?: true

              # @!attribute flagged
              #   Whether the content was flagged by moderation
              #
              #   @return [Boolean, nil]
              required :flagged, ModerationAPI::Internal::Type::Boolean, nil?: true

              # @!attribute labels
              #   Moderation labels applied to the content
              #
              #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label>, nil]
              required :labels,
                       -> {
                         ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label]
                       },
                       nil?: true

              # @!attribute language
              #   Detected ISO language code, if available
              #
              #   @return [String, nil]
              required :language, String, nil?: true

              # @!attribute meta_type
              #   High-level content type (e.g. message, post, comment). Defaults to the channel's
              #   configured content type but can be overridden per request via the moderation API
              #   `type` field.
              #
              #   @return [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType, nil]
              required :meta_type,
                       enum: -> {
                         ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType
                       },
                       nil?: true

              # @!attribute metadata
              #   Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :metadata,
                       ModerationAPI::Internal::Type::HashOf[ModerationAPI::Internal::Type::Unknown],
                       nil?: true

              # @!attribute timestamp
              #   ISO 8601 timestamp of when the content was submitted
              #
              #   @return [Time]
              required :timestamp, Time

              # @!method initialize(id:, author_id:, channel_key:, content:, conversation_id:, flagged:, labels:, language:, meta_type:, metadata:, timestamp:)
              #   Some parameter documentations has been truncated, see
              #   {ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item} for
              #   more details.
              #
              #   The content item the action was performed on, if any
              #
              #   @param id [String] Content ID from your system
              #
              #   @param author_id [String, nil] External author ID (the customer's identifier, not Moderation API's internal id)
              #
              #   @param channel_key [String, nil] The channel the content was submitted to, identified by your customer-defined ch
              #
              #   @param content [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object] The original content payload
              #
              #   @param conversation_id [String, nil] Conversation grouping ID, if any
              #
              #   @param flagged [Boolean, nil] Whether the content was flagged by moderation
              #
              #   @param labels [Array<ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label>, nil] Moderation labels applied to the content
              #
              #   @param language [String, nil] Detected ISO language code, if available
              #
              #   @param meta_type [Symbol, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::MetaType, nil] High-level content type (e.g. message, post, comment). Defaults to the channel's
              #
              #   @param metadata [Hash{Symbol=>Object}, nil] Arbitrary key/value metadata. Top-level keys are strings.
              #
              #   @param timestamp [Time] ISO 8601 timestamp of when the content was submitted

              # The original content payload
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item#content
              module Content
                extend ModerationAPI::Internal::Type::Union

                # Text
                variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text }

                # Image
                variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image }

                # Video
                variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video }

                # Audio
                variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio }

                # Object
                variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object }

                class Text < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute text
                  #   The content text
                  #
                  #   @return [String]
                  required :text, String

                  # @!attribute type
                  #
                  #   @return [Symbol, :text]
                  required :type, const: :text

                  # @!method initialize(text:, type: :text)
                  #   Text
                  #
                  #   @param text [String] The content text
                  #
                  #   @param type [Symbol, :text]
                end

                class Image < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :image]
                  required :type, const: :image

                  # @!attribute data
                  #   Base64-encoded image data. Either url or data must be provided. Note: base64
                  #   images are not stored and will not appear in the review queue.
                  #
                  #   @return [String, nil]
                  optional :data, String

                  # @!attribute url
                  #   A public URL of the image content. Either url or data must be provided.
                  #
                  #   @return [String, nil]
                  optional :url, String

                  # @!method initialize(data: nil, url: nil, type: :image)
                  #   Some parameter documentations has been truncated, see
                  #   {ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image}
                  #   for more details.
                  #
                  #   Image
                  #
                  #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                  #
                  #   @param url [String] A public URL of the image content. Either url or data must be provided.
                  #
                  #   @param type [Symbol, :image]
                end

                class Video < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :video]
                  required :type, const: :video

                  # @!attribute url
                  #   A public URL of the video content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :video)
                  #   Video
                  #
                  #   @param url [String] A public URL of the video content
                  #
                  #   @param type [Symbol, :video]
                end

                class Audio < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :audio]
                  required :type, const: :audio

                  # @!attribute url
                  #   The URL of the audio content
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :audio)
                  #   Audio
                  #
                  #   @param url [String] The URL of the audio content
                  #
                  #   @param type [Symbol, :audio]
                end

                class Object < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute data
                  #   Values in the object. Can be mixed content types.
                  #
                  #   @return [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio}]
                  required :data,
                           -> { ModerationAPI::Internal::Type::HashOf[union: ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data] }

                  # @!attribute type
                  #
                  #   @return [Symbol, :object]
                  required :type, const: :object

                  # @!method initialize(data:, type: :object)
                  #   Object
                  #
                  #   @param data [Hash{Symbol=>ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio}] Values in the object. Can be mixed content types.
                  #
                  #   @param type [Symbol, :object]

                  # Text
                  module Data
                    extend ModerationAPI::Internal::Type::Union

                    # Text
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text }

                    # Image
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image }

                    # Video
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video }

                    # Audio
                    variant -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio }

                    class Text < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute text
                      #   The content text
                      #
                      #   @return [String]
                      required :text, String

                      # @!attribute type
                      #
                      #   @return [Symbol, :text]
                      required :type, const: :text

                      # @!method initialize(text:, type: :text)
                      #   Text
                      #
                      #   @param text [String] The content text
                      #
                      #   @param type [Symbol, :text]
                    end

                    class Image < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :image]
                      required :type, const: :image

                      # @!attribute data
                      #   Base64-encoded image data. Either url or data must be provided. Note: base64
                      #   images are not stored and will not appear in the review queue.
                      #
                      #   @return [String, nil]
                      optional :data, String

                      # @!attribute url
                      #   A public URL of the image content. Either url or data must be provided.
                      #
                      #   @return [String, nil]
                      optional :url, String

                      # @!method initialize(data: nil, url: nil, type: :image)
                      #   Some parameter documentations has been truncated, see
                      #   {ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image}
                      #   for more details.
                      #
                      #   Image
                      #
                      #   @param data [String] Base64-encoded image data. Either url or data must be provided. Note: base64 ima
                      #
                      #   @param url [String] A public URL of the image content. Either url or data must be provided.
                      #
                      #   @param type [Symbol, :image]
                    end

                    class Video < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :video]
                      required :type, const: :video

                      # @!attribute url
                      #   A public URL of the video content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :video)
                      #   Video
                      #
                      #   @param url [String] A public URL of the video content
                      #
                      #   @param type [Symbol, :video]
                    end

                    class Audio < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :audio]
                      required :type, const: :audio

                      # @!attribute url
                      #   The URL of the audio content
                      #
                      #   @return [String]
                      required :url, String

                      # @!method initialize(url:, type: :audio)
                      #   Audio
                      #
                      #   @param url [String] The URL of the audio content
                      #
                      #   @param type [Symbol, :audio]
                    end

                    # @!method self.variants
                    #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object::Data::Audio)]
                  end
                end

                # @!method self.variants
                #   @return [Array(ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Text, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Image, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Video, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Audio, ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Content::Object)]
              end

              class Label < ModerationAPI::Internal::Type::BaseModel
                # @!attribute label
                #   The label name
                #
                #   @return [String]
                required :label, String

                # @!attribute score
                #   Confidence score between 0 and 1
                #
                #   @return [Float]
                required :score, Float

                # @!attribute flagged
                #   Whether this label crossed its flagging threshold
                #
                #   @return [Boolean, nil]
                optional :flagged, ModerationAPI::Internal::Type::Boolean

                # @!attribute manual
                #   True if the label was applied manually by a moderator
                #
                #   @return [Boolean, nil]
                optional :manual, ModerationAPI::Internal::Type::Boolean

                # @!attribute matches
                #
                #   @return [Array<ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match>, nil]
                optional :matches,
                         -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match] }

                # @!method initialize(label:, score:, flagged: nil, manual: nil, matches: nil)
                #   @param label [String] The label name
                #
                #   @param score [Float] Confidence score between 0 and 1
                #
                #   @param flagged [Boolean] Whether this label crossed its flagging threshold
                #
                #   @param manual [Boolean] True if the label was applied manually by a moderator
                #
                #   @param matches [Array<ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match>]

                class Match < ModerationAPI::Internal::Type::BaseModel
                  # @!attribute match
                  #   The matched substring
                  #
                  #   @return [String]
                  required :match, String

                  # @!attribute probability
                  #   Match confidence between 0 and 1
                  #
                  #   @return [Float]
                  required :probability, Float

                  # @!attribute span
                  #   [start, end] character offsets in the source text
                  #
                  #   @return [Array<Object>]
                  required :span, ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Internal::Type::Unknown]

                  # @!attribute entity_type
                  #
                  #   @return [String, nil]
                  optional :entity_type, String

                  # @!attribute mask
                  #
                  #   @return [String, nil]
                  optional :mask, String, nil?: true

                  # @!attribute reasons
                  #
                  #   @return [Array<String>, nil]
                  optional :reasons, ModerationAPI::Internal::Type::ArrayOf[String]

                  # @!attribute signals
                  #
                  #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals, nil]
                  optional :signals,
                           -> { ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals }

                  # @!method initialize(match:, probability:, span:, entity_type: nil, mask: nil, reasons: nil, signals: nil)
                  #   @param match [String] The matched substring
                  #
                  #   @param probability [Float] Match confidence between 0 and 1
                  #
                  #   @param span [Array<Object>] [start, end] character offsets in the source text
                  #
                  #   @param entity_type [String]
                  #
                  #   @param mask [String, nil]
                  #
                  #   @param reasons [Array<String>]
                  #
                  #   @param signals [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals]

                  # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match#signals
                  class Signals < ModerationAPI::Internal::Type::BaseModel
                    # @!attribute bot_protection
                    #
                    #   @return [Boolean, nil]
                    required :bot_protection, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute brand_impersonation
                    #
                    #   @return [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    required :brand_impersonation,
                             -> {
                               ModerationAPI::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation
                             },
                             nil?: true

                    # @!attribute domain_age_days
                    #
                    #   @return [Float, nil]
                    required :domain_age_days, Float, nil?: true

                    # @!attribute final_url
                    #
                    #   @return [String, nil]
                    required :final_url, String, nil?: true

                    # @!attribute has_email_setup
                    #
                    #   @return [Boolean, nil]
                    required :has_email_setup, ModerationAPI::Internal::Type::Boolean, nil?: true

                    # @!attribute has_suspicious_characters
                    #
                    #   @return [Boolean]
                    required :has_suspicious_characters, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_link_shortener
                    #
                    #   @return [Boolean]
                    required :is_link_shortener, ModerationAPI::Internal::Type::Boolean

                    # @!attribute is_reported
                    #
                    #   @return [Boolean]
                    required :is_reported, ModerationAPI::Internal::Type::Boolean

                    # @!attribute redirect_count
                    #
                    #   @return [Float, nil]
                    required :redirect_count, Float, nil?: true

                    # @!method initialize(bot_protection:, brand_impersonation:, domain_age_days:, final_url:, has_email_setup:, has_suspicious_characters:, is_link_shortener:, is_reported:, redirect_count:)
                    #   @param bot_protection [Boolean, nil]
                    #   @param brand_impersonation [ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals::BrandImpersonation, nil]
                    #   @param domain_age_days [Float, nil]
                    #   @param final_url [String, nil]
                    #   @param has_email_setup [Boolean, nil]
                    #   @param has_suspicious_characters [Boolean]
                    #   @param is_link_shortener [Boolean]
                    #   @param is_reported [Boolean]
                    #   @param redirect_count [Float, nil]

                    # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item::Label::Match::Signals#brand_impersonation
                    class BrandImpersonation < ModerationAPI::Internal::Type::BaseModel
                      # @!attribute brand
                      #
                      #   @return [String]
                      required :brand, String

                      # @!attribute method_
                      #
                      #   @return [String]
                      required :method_, String, api_name: :method

                      # @!method initialize(brand:, method_:)
                      #   @param brand [String]
                      #   @param method_ [String]
                    end
                  end
                end
              end

              # High-level content type (e.g. message, post, comment). Defaults to the channel's
              # configured content type but can be overridden per request via the moderation API
              # `type` field.
              #
              # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object::Item#meta_type
              module MetaType
                extend ModerationAPI::Internal::Type::Enum

                PROFILE = :profile
                MESSAGE = :message
                POST = :post
                COMMENT = :comment
                EVENT = :event
                PRODUCT = :product
                REVIEW = :review
                OTHER = :other

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ModerationAPI::Models::WebhookEvent::QueueItemAllowed::Data::Object#queue
            class Queue < ModerationAPI::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   The queue the item belongs to, if any
              #
              #   @param id [String]
            end
          end
        end
      end

      # @!method self.variants
      #   @return [Array(ModerationAPI::Models::WebhookEvent::AuthorBlocked, ModerationAPI::Models::WebhookEvent::AuthorUnblocked, ModerationAPI::Models::WebhookEvent::AuthorSuspended, ModerationAPI::Models::WebhookEvent::AuthorUpdated, ModerationAPI::Models::WebhookEvent::AuthorTrustLevelChanged, ModerationAPI::Models::WebhookEvent::AuthorAction, ModerationAPI::Models::WebhookEvent::QueueItemResolved, ModerationAPI::Models::WebhookEvent::QueueItemAction, ModerationAPI::Models::WebhookEvent::QueueItemRejected, ModerationAPI::Models::WebhookEvent::QueueItemAllowed)]
    end
  end
end
