# typed: strong

module ModerationAPI
  module Resources
    class Queue
      class Items
        # Get paginated list of items in a moderation queue with filtering options
        sig do
          params(
            id: String,
            after_date: String,
            author_id: String,
            before_date: String,
            conversation_ids: String,
            filtered_action_ids: String,
            include_resolved: String,
            labels: String,
            page_number: String,
            page_size: String,
            sort_direction:
              ModerationAPI::Queue::ItemListParams::SortDirection::OrSymbol,
            sort_field:
              ModerationAPI::Queue::ItemListParams::SortField::OrSymbol,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Queue::ItemListResponse)
        end
        def list(
          # The queue ID
          id,
          after_date: nil,
          author_id: nil,
          before_date: nil,
          conversation_ids: nil,
          filtered_action_ids: nil,
          include_resolved: nil,
          labels: nil,
          # Page number to fetch
          page_number: nil,
          # Number of items per page
          page_size: nil,
          # Sort direction
          sort_direction: nil,
          sort_field: nil,
          request_options: {}
        )
        end

        # Mark a queue item as resolved with a specific moderation action
        sig do
          params(
            item_id: String,
            id: String,
            comment: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Queue::ItemResolveResponse)
        end
        def resolve(
          # Path param: The item ID to resolve
          item_id,
          # Path param: The queue ID
          id:,
          # Body param: Optional comment
          comment: nil,
          request_options: {}
        )
        end

        # Mark a previously resolved queue item as unresolved/pending
        sig do
          params(
            item_id: String,
            id: String,
            comment: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Queue::ItemUnresolveResponse)
        end
        def unresolve(
          # Path param: The item ID to unresolve
          item_id,
          # Path param: The queue ID
          id:,
          # Body param: Optional reason for unresolving the item
          comment: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
