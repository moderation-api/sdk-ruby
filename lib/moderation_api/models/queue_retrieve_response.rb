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

          # @!attribute before_date
          #
          #   @return [String, nil]
          optional :before_date, String, api_name: :beforeDate

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

          # @!attribute labels
          #
          #   @return [Array<String>, nil]
          optional :labels, ModerationAPI::Internal::Type::ArrayOf[String]

          # @!attribute recommendation_actions
          #
          #   @return [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction>, nil]
          optional :recommendation_actions,
                   -> { ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction] },
                   api_name: :recommendationActions

          # @!attribute show_checked
          #
          #   @return [Boolean, nil]
          optional :show_checked, ModerationAPI::Internal::Type::Boolean, api_name: :showChecked

          # @!method initialize(after_date: nil, author_id: nil, before_date: nil, conversation_ids: nil, filtered_action_ids: nil, filtered_channel_ids: nil, filter_labels: nil, labels: nil, recommendation_actions: nil, show_checked: nil)
          #   @param after_date [String]
          #   @param author_id [String]
          #   @param before_date [String]
          #   @param conversation_ids [Array<String, nil>]
          #   @param filtered_action_ids [Array<String>]
          #   @param filtered_channel_ids [Array<String>]
          #   @param filter_labels [Array<ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel>]
          #   @param labels [Array<String>]
          #   @param recommendation_actions [Array<Symbol, ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction>]
          #   @param show_checked [Boolean]

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

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          module RecommendationAction
            extend ModerationAPI::Internal::Type::Enum

            REVIEW = :review
            ALLOW = :allow
            REJECT = :reject

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
