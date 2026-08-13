# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Queue#retrieve
    class QueueRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute queue
      #
      #   @return [ModerationAPI::Models::QueueRetrieveResponse::Queue]
      required :queue, -> { ModerationAPI::Models::QueueRetrieveResponse::Queue }

      # @!method initialize(queue:)
      #   @param queue [ModerationAPI::Models::QueueRetrieveResponse::Queue]

      # @see ModerationAPI::Models::QueueRetrieveResponse#queue
      class Queue < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute filter
        #
        #   @return [ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter]
        required :filter, -> { ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute resolved_items_count
        #
        #   @return [Float]
        required :resolved_items_count, Float, api_name: :resolvedItemsCount

        # @!attribute total_items_count
        #
        #   @return [Float]
        required :total_items_count, Float, api_name: :totalItemsCount

        # @!attribute unresolved_items_count
        #
        #   @return [Float]
        required :unresolved_items_count, Float, api_name: :unresolvedItemsCount

        # @!method initialize(id:, description:, filter:, name:, resolved_items_count:, total_items_count:, unresolved_items_count:)
        #   @param id [String]
        #   @param description [String]
        #   @param filter [ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter]
        #   @param name [String]
        #   @param resolved_items_count [Float]
        #   @param total_items_count [Float]
        #   @param unresolved_items_count [Float]

        # @see ModerationAPI::Models::QueueRetrieveResponse::Queue#filter
        class Filter < ModerationAPI::Internal::Type::BaseModel
          # @!attribute after_date
          #
          #   @return [String, nil]
          optional :after_date, String, api_name: :afterDate

          # @!attribute author_id
          #
          #   @return [String, nil]
          optional :author_id, String, api_name: :authorID

          # @!attribute author_trust_levels
          #
          #   @return [Array<Integer>, nil]
          optional :author_trust_levels,
                   ModerationAPI::Internal::Type::ArrayOf[Integer],
                   api_name: :authorTrustLevels

          # @!attribute before_date
          #
          #   @return [String, nil]
          optional :before_date, String, api_name: :beforeDate

          # @!attribute check_status
          #
          #   @return [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus, nil]
          optional :check_status,
                   enum: -> { ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus },
                   api_name: :checkStatus,
                   nil?: true

          # @!attribute clear_date_window
          #
          #   @return [Boolean, nil]
          optional :clear_date_window, ModerationAPI::Internal::Type::Boolean, api_name: :clearDateWindow

          # @!attribute content_id
          #
          #   @return [String, nil]
          optional :content_id, String, api_name: :contentID

          # @!attribute content_types
          #
          #   @return [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType>, nil]
          optional :content_types,
                   -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType] },
                   api_name: :contentTypes

          # @!attribute conversation_ids
          #
          #   @return [Array<String, nil>, nil]
          optional :conversation_ids,
                   ModerationAPI::Internal::Type::ArrayOf[String, nil?: true],
                   api_name: :conversationIds

          # @!attribute filtered_action_ids
          #
          #   @return [Array<String>, nil]
          optional :filtered_action_ids,
                   ModerationAPI::Internal::Type::ArrayOf[String],
                   api_name: :filteredActionIds

          # @!attribute filtered_channel_ids
          #
          #   @return [Array<String>, nil]
          optional :filtered_channel_ids,
                   ModerationAPI::Internal::Type::ArrayOf[String],
                   api_name: :filteredChannelIds

          # @!attribute filter_labels
          #
          #   @return [Array<ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel>, nil]
          optional :filter_labels,
                   -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel] },
                   api_name: :filterLabels

          # @!attribute is_flagged
          #
          #   @return [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged, nil]
          optional :is_flagged,
                   enum: -> { ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged },
                   api_name: :isFlagged

          # @!attribute labels
          #
          #   @return [Array<String>, nil]
          optional :labels, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!attribute languages
          #
          #   @return [Array<String>, nil]
          optional :languages, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!attribute media_types
          #
          #   @return [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType>, nil]
          optional :media_types,
                   -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType] },
                   api_name: :mediaTypes

          # @!attribute recommendation_actions
          #
          #   @return [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction>, nil]
          optional :recommendation_actions,
                   -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction] },
                   api_name: :recommendationActions

          # @!attribute search
          #
          #   @return [Array<String>, nil]
          optional :search, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!attribute within
          #
          #   @return [Float, nil]
          optional :within, Float

          # @!attribute within_unit
          #
          #   @return [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit, nil]
          optional :within_unit,
                   enum: -> { ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit },
                   api_name: :withinUnit

          # @!method initialize(after_date: nil, author_id: nil, author_trust_levels: nil, before_date: nil, check_status: nil, clear_date_window: nil, content_id: nil, content_types: nil, conversation_ids: nil, filtered_action_ids: nil, filtered_channel_ids: nil, filter_labels: nil, is_flagged: nil, labels: nil, languages: nil, media_types: nil, recommendation_actions: nil, search: nil, within: nil, within_unit: nil)
          #   @param after_date [String]
          #   @param author_id [String]
          #   @param author_trust_levels [Array<Integer>]
          #   @param before_date [String]
          #   @param check_status [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus, nil]
          #   @param clear_date_window [Boolean]
          #   @param content_id [String]
          #   @param content_types [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType>]
          #   @param conversation_ids [Array<String, nil>]
          #   @param filtered_action_ids [Array<String>]
          #   @param filtered_channel_ids [Array<String>]
          #   @param filter_labels [Array<ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel>]
          #   @param is_flagged [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged]
          #   @param labels [Array<String>]
          #   @param languages [Array<String>]
          #   @param media_types [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType>]
          #   @param recommendation_actions [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction>]
          #   @param search [Array<String>]
          #   @param within [Float]
          #   @param within_unit [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit]

          # @see ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter#check_status
          module CheckStatus
            extend ModerationAPI::Internal::Type::Enum

            ALL = :all
            CHECKED = :checked
            UNCHECKED = :unchecked

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          module ContentType
            extend ModerationAPI::Internal::Type::Enum

            PROFILE = :profile
            MESSAGE = :message
            POST = :post
            COMMENT = :comment
            EVENT = :event
            PRODUCT = :product
            REVIEW = :review
            VOICE = :voice
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class FilterLabel < ModerationAPI::Internal::Type::BaseModel
            # @!attribute label
            #
            #   @return [String]
            required :label, String

            # @!attribute type
            #
            #   @return [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type]
            required :type,
                     enum: -> { ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type }

            # @!attribute max_threshold
            #
            #   @return [Float, nil]
            optional :max_threshold, Float, api_name: :maxThreshold, nil?: true

            # @!attribute min_threshold
            #
            #   @return [Float, nil]
            optional :min_threshold, Float, api_name: :minThreshold, nil?: true

            # @!method initialize(label:, type:, max_threshold: nil, min_threshold: nil)
            #   @param label [String]
            #   @param type [Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type]
            #   @param max_threshold [Float, nil]
            #   @param min_threshold [Float, nil]

            # @see ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel#type
            module Type
              extend ModerationAPI::Internal::Type::Enum

              FLAGGED = :FLAGGED
              NOT_FLAGGED = :NOT_FLAGGED
              THRESHOLDS = :THRESHOLDS
              MATCHED = :MATCHED

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter#is_flagged
          module IsFlagged
            extend ModerationAPI::Internal::Type::Enum

            ALL = :ALL
            FLAGGED = :FLAGGED
            NOT_FLAGGED = :NOT_FLAGGED
            SHADOW_FLAGGED = :SHADOW_FLAGGED

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          module MediaType
            extend ModerationAPI::Internal::Type::Enum

            TEXT = :text
            IMAGE = :image
            VIDEO = :video
            OBJECT = :object
            AUDIO = :audio

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          module RecommendationAction
            extend ModerationAPI::Internal::Type::Enum

            REVIEW = :review
            ALLOW = :allow
            REJECT = :reject

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter#within_unit
          module WithinUnit
            extend ModerationAPI::Internal::Type::Enum

            MINUTES = :MINUTES
            HOURS = :HOURS
            DAYS = :DAYS
            WEEKS = :WEEKS
            MONTHS = :MONTHS
            YEARS = :YEARS

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
