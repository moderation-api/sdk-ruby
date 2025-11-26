# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Queue
      class Items
        # Get paginated list of items in a moderation queue with filtering options
        #
        # @overload list(id, after_date: nil, author_id: nil, before_date: nil, conversation_ids: nil, filtered_action_ids: nil, include_resolved: nil, labels: nil, page_number: nil, page_size: nil, sort_direction: nil, sort_field: nil, request_options: {})
        #
        # @param id [String] The queue ID
        #
        # @param after_date [String]
        #
        # @param author_id [String]
        #
        # @param before_date [String]
        #
        # @param conversation_ids [String]
        #
        # @param filtered_action_ids [String]
        #
        # @param include_resolved [String]
        #
        # @param labels [String]
        #
        # @param page_number [String] Page number to fetch
        #
        # @param page_size [String] Number of items per page
        #
        # @param sort_direction [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortDirection] Sort direction
        #
        # @param sort_field [Symbol, ModerationAPI::Models::Queue::ItemListParams::SortField]
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Queue::ItemListResponse]
        #
        # @see ModerationAPI::Models::Queue::ItemListParams
        def list(id, params = {})
          parsed, options = ModerationAPI::Queue::ItemListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["queue/%1$s/items", id],
            query: parsed.transform_keys(
              after_date: "afterDate",
              author_id: "authorId",
              before_date: "beforeDate",
              conversation_ids: "conversationIds",
              filtered_action_ids: "filteredActionIds",
              include_resolved: "includeResolved",
              page_number: "pageNumber",
              page_size: "pageSize",
              sort_direction: "sortDirection",
              sort_field: "sortField"
            ),
            model: ModerationAPI::Models::Queue::ItemListResponse,
            options: options
          )
        end

        # Mark a queue item as resolved with a specific moderation action
        #
        # @overload resolve(item_id, id:, comment: nil, request_options: {})
        #
        # @param item_id [String] Path param: The item ID to resolve
        #
        # @param id [String] Path param: The queue ID
        #
        # @param comment [String] Body param: Optional comment
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Queue::ItemResolveResponse]
        #
        # @see ModerationAPI::Models::Queue::ItemResolveParams
        def resolve(item_id, params)
          parsed, options = ModerationAPI::Queue::ItemResolveParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["queue/%1$s/items/%2$s/resolve", id, item_id],
            body: parsed,
            model: ModerationAPI::Models::Queue::ItemResolveResponse,
            options: options
          )
        end

        # Mark a previously resolved queue item as unresolved/pending
        #
        # @overload unresolve(item_id, id:, comment: nil, request_options: {})
        #
        # @param item_id [String] Path param: The item ID to unresolve
        #
        # @param id [String] Path param: The queue ID
        #
        # @param comment [String] Body param: Optional reason for unresolving the item
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Queue::ItemUnresolveResponse]
        #
        # @see ModerationAPI::Models::Queue::ItemUnresolveParams
        def unresolve(item_id, params)
          parsed, options = ModerationAPI::Queue::ItemUnresolveParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["queue/%1$s/items/%2$s/unresolve", id, item_id],
            body: parsed,
            model: ModerationAPI::Models::Queue::ItemUnresolveResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ModerationAPI::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
