# frozen_string_literal: true

module ModerationAPI
  module Models
    module Queue
      # @see ModerationAPI::Resources::Queue::Items#list
      class ItemListResponse < ModerationAPI::Internal::Type::BaseModel
        # @!attribute items
        #
        #   @return [Array<ModerationAPI::Models::Queue::ItemListResponse::Item>]
        required :items,
                 -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::Queue::ItemListResponse::Item] }

        # @!attribute pagination
        #
        #   @return [ModerationAPI::Models::Queue::ItemListResponse::Pagination]
        required :pagination, -> { ModerationAPI::Models::Queue::ItemListResponse::Pagination }

        # @!method initialize(items:, pagination:)
        #   @param items [Array<ModerationAPI::Models::Queue::ItemListResponse::Item>]
        #   @param pagination [ModerationAPI::Models::Queue::ItemListResponse::Pagination]

        class Item < ModerationAPI::Internal::Type::BaseModel
          # @!attribute id
          #   Content ID
          #
          #   @return [String]
          required :id, String

          # @!attribute content
          #   The content to be moderated
          #
          #   @return [String]
          required :content, String

          # @!attribute flagged
          #   Whether the item is flagged by any label
          #
          #   @return [Boolean]
          required :flagged, ModerationAPI::Internal::Type::Boolean

          # @!attribute labels
          #
          #   @return [Array<ModerationAPI::Models::Queue::ItemListResponse::Item::Label>]
          required :labels,
                   -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::Queue::ItemListResponse::Item::Label] }

          # @!attribute status
          #   Status of the item
          #
          #   @return [Symbol, ModerationAPI::Models::Queue::ItemListResponse::Item::Status]
          required :status, enum: -> { ModerationAPI::Models::Queue::ItemListResponse::Item::Status }

          # @!attribute timestamp
          #   Unix timestamp of when the item was created
          #
          #   @return [Float]
          required :timestamp, Float

          # @!attribute actions
          #   Action IDs taken on this item
          #
          #   @return [Array<ModerationAPI::Models::Queue::ItemListResponse::Item::Action>, nil]
          optional :actions,
                   -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::Queue::ItemListResponse::Item::Action] }

          # @!attribute author_id
          #   Author ID
          #
          #   @return [String, nil]
          optional :author_id, String, api_name: :authorId

          # @!attribute content_type
          #   Type of the content object
          #
          #   @return [String, nil]
          optional :content_type, String, api_name: :contentType

          # @!attribute conversation_id
          #   Conversation ID
          #
          #   @return [String, nil]
          optional :conversation_id, String, api_name: :conversationId

          # @!attribute language
          #   Content language
          #
          #   @return [String, nil]
          optional :language, String

          # @!method initialize(id:, content:, flagged:, labels:, status:, timestamp:, actions: nil, author_id: nil, content_type: nil, conversation_id: nil, language: nil)
          #   @param id [String] Content ID
          #
          #   @param content [String] The content to be moderated
          #
          #   @param flagged [Boolean] Whether the item is flagged by any label
          #
          #   @param labels [Array<ModerationAPI::Models::Queue::ItemListResponse::Item::Label>]
          #
          #   @param status [Symbol, ModerationAPI::Models::Queue::ItemListResponse::Item::Status] Status of the item
          #
          #   @param timestamp [Float] Unix timestamp of when the item was created
          #
          #   @param actions [Array<ModerationAPI::Models::Queue::ItemListResponse::Item::Action>] Action IDs taken on this item
          #
          #   @param author_id [String] Author ID
          #
          #   @param content_type [String] Type of the content object
          #
          #   @param conversation_id [String] Conversation ID
          #
          #   @param language [String] Content language

          class Label < ModerationAPI::Internal::Type::BaseModel
            # @!attribute flagged
            #   Whether this label caused a flag
            #
            #   @return [Boolean]
            required :flagged, ModerationAPI::Internal::Type::Boolean

            # @!attribute label
            #   Label name
            #
            #   @return [String]
            required :label, String

            # @!attribute score
            #   Confidence score of the label
            #
            #   @return [Float]
            required :score, Float

            # @!method initialize(flagged:, label:, score:)
            #   @param flagged [Boolean] Whether this label caused a flag
            #
            #   @param label [String] Label name
            #
            #   @param score [Float] Confidence score of the label
          end

          # Status of the item
          #
          # @see ModerationAPI::Models::Queue::ItemListResponse::Item#status
          module Status
            extend ModerationAPI::Internal::Type::Enum

            PENDING = :pending
            RESOLVED = :resolved

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Action < ModerationAPI::Internal::Type::BaseModel
            # @!attribute id
            #   Action ID
            #
            #   @return [String]
            required :id, String

            # @!attribute name
            #   Action name
            #
            #   @return [String]
            required :name, String

            # @!attribute timestamp
            #   Unix timestamp of when the action was taken
            #
            #   @return [Float]
            required :timestamp, Float

            # @!attribute comment
            #   Action comment
            #
            #   @return [String, nil]
            optional :comment, String

            # @!attribute reviewer
            #   Moderator userID
            #
            #   @return [String, nil]
            optional :reviewer, String

            # @!method initialize(id:, name:, timestamp:, comment: nil, reviewer: nil)
            #   @param id [String] Action ID
            #
            #   @param name [String] Action name
            #
            #   @param timestamp [Float] Unix timestamp of when the action was taken
            #
            #   @param comment [String] Action comment
            #
            #   @param reviewer [String] Moderator userID
          end
        end

        # @see ModerationAPI::Models::Queue::ItemListResponse#pagination
        class Pagination < ModerationAPI::Internal::Type::BaseModel
          # @!attribute current_page
          #
          #   @return [Float]
          required :current_page, Float, api_name: :currentPage

          # @!attribute has_next_page
          #
          #   @return [Boolean]
          required :has_next_page, ModerationAPI::Internal::Type::Boolean, api_name: :hasNextPage

          # @!attribute has_previous_page
          #
          #   @return [Boolean]
          required :has_previous_page, ModerationAPI::Internal::Type::Boolean, api_name: :hasPreviousPage

          # @!attribute total_items
          #
          #   @return [Float]
          required :total_items, Float, api_name: :totalItems

          # @!attribute total_pages
          #
          #   @return [Float]
          required :total_pages, Float, api_name: :totalPages

          # @!method initialize(current_page:, has_next_page:, has_previous_page:, total_items:, total_pages:)
          #   @param current_page [Float]
          #   @param has_next_page [Boolean]
          #   @param has_previous_page [Boolean]
          #   @param total_items [Float]
          #   @param total_pages [Float]
        end
      end
    end
  end
end
