# frozen_string_literal: true

module ModerationAPI
  module Models
    module Queue
      # @see ModerationAPI::Resources::Queue::Items#list
      class ItemListParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute after_date
        #
        #   @return [String, nil]
        optional :after_date, String

        # @!attribute author_id
        #
        #   @return [String, nil]
        optional :author_id, String

        # @!attribute before_date
        #
        #   @return [String, nil]
        optional :before_date, String

        # @!attribute conversation_ids
        #
        #   @return [String, nil]
        optional :conversation_ids, String

        # @!attribute filtered_action_ids
        #
        #   @return [String, nil]
        optional :filtered_action_ids, String

        # @!attribute include_resolved
        #
        #   @return [String, nil]
        optional :include_resolved, String

        # @!attribute labels
        #
        #   @return [String, nil]
        optional :labels, String

        # @!attribute page_number
        #   Page number to fetch
        #
        #   @return [Float, nil]
        optional :page_number, Float

        # @!attribute page_size
        #   Number of items per page
        #
        #   @return [Float, nil]
        optional :page_size, Float

        # @!attribute sort_direction
        #   Sort direction
        #
        #   @return [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortDirection, nil]
        optional :sort_direction, enum: -> { ModerationAPI::Queue::ItemListParams::SortDirection }

        # @!attribute sort_field
        #
        #   @return [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortField, nil]
        optional :sort_field, enum: -> { ModerationAPI::Queue::ItemListParams::SortField }

        # @!method initialize(after_date: nil, author_id: nil, before_date: nil, conversation_ids: nil, filtered_action_ids: nil, include_resolved: nil, labels: nil, page_number: nil, page_size: nil, sort_direction: nil, sort_field: nil, request_options: {})
        #   @param after_date [String]
        #
        #   @param author_id [String]
        #
        #   @param before_date [String]
        #
        #   @param conversation_ids [String]
        #
        #   @param filtered_action_ids [String]
        #
        #   @param include_resolved [String]
        #
        #   @param labels [String]
        #
        #   @param page_number [Float] Page number to fetch
        #
        #   @param page_size [Float] Number of items per page
        #
        #   @param sort_direction [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortDirection] Sort direction
        #
        #   @param sort_field [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortField]
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

        # Sort direction
        module SortDirection
          extend ModerationAPI::Internal::Type::Enum

          ASC = :asc
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module SortField
          extend ModerationAPI::Internal::Type::Enum

          CREATED_AT = :createdAt
          SEVERITY = :severity
          REVIEWED_AT = :reviewedAt

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
