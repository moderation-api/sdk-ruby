# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Authors
      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::AuthorCreateParams} for more details.
      #
      # Create a new author. Typically not needed as authors are created automatically
      # when content is moderated.
      #
      # @overload create(external_id:, email: nil, external_link: nil, first_seen: nil, last_seen: nil, manual_trust_level: nil, metadata: nil, name: nil, profile_picture: nil, request_options: {})
      #
      # @param external_id [String] External ID of the user, typically the ID of the author in your database.
      #
      # @param email [String, nil] Author email address
      #
      # @param external_link [String, nil] URL of the author's external profile
      #
      # @param first_seen [Float] Timestamp when author first appeared
      #
      # @param last_seen [Float] Timestamp of last activity
      #
      # @param manual_trust_level [Float, nil]
      #
      # @param metadata [ModerationAPI::Models::AuthorCreateParams::Metadata] Additional metadata provided by your system. We recommend including any relevant
      #
      # @param name [String, nil] Author name or identifier
      #
      # @param profile_picture [String, nil] URL of the author's profile picture
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthorCreateResponse]
      #
      # @see ModerationAPI::Models::AuthorCreateParams
      def create(params)
        parsed, options = ModerationAPI::AuthorCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "authors",
          body: parsed,
          model: ModerationAPI::Models::AuthorCreateResponse,
          options: options
        )
      end

      # Get detailed information about a specific author including historical data and
      # analysis
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Either external ID or the ID assigned by moderation API.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthorRetrieveResponse]
      #
      # @see ModerationAPI::Models::AuthorRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["authors/%1$s", id],
          model: ModerationAPI::Models::AuthorRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::AuthorUpdateParams} for more details.
      #
      # Update the details of a specific author
      #
      # @overload update(id, email: nil, external_link: nil, first_seen: nil, last_seen: nil, manual_trust_level: nil, metadata: nil, name: nil, profile_picture: nil, request_options: {})
      #
      # @param id [String] Either external ID or the ID assigned by moderation API.
      #
      # @param email [String, nil] Author email address
      #
      # @param external_link [String, nil] URL of the author's external profile
      #
      # @param first_seen [Float] Timestamp when author first appeared
      #
      # @param last_seen [Float] Timestamp of last activity
      #
      # @param manual_trust_level [Float, nil]
      #
      # @param metadata [ModerationAPI::Models::AuthorUpdateParams::Metadata] Additional metadata provided by your system. We recommend including any relevant
      #
      # @param name [String, nil] Author name or identifier
      #
      # @param profile_picture [String, nil] URL of the author's profile picture
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthorUpdateResponse]
      #
      # @see ModerationAPI::Models::AuthorUpdateParams
      def update(id, params = {})
        parsed, options = ModerationAPI::AuthorUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["authors/%1$s", id],
          body: parsed,
          model: ModerationAPI::Models::AuthorUpdateResponse,
          options: options
        )
      end

      # Get a paginated list of authors with their activity metrics and reputation
      #
      # @overload list(content_types: nil, last_active_date: nil, member_since_date: nil, page_number: nil, page_size: nil, sort_by: nil, sort_direction: nil, request_options: {})
      #
      # @param content_types [String]
      #
      # @param last_active_date [String]
      #
      # @param member_since_date [String]
      #
      # @param page_number [Float] Page number to fetch
      #
      # @param page_size [Float] Number of authors per page
      #
      # @param sort_by [Symbol, ModerationAPI::Models::AuthorListParams::SortBy]
      #
      # @param sort_direction [Symbol, ModerationAPI::Models::AuthorListParams::SortDirection] Sort direction
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthorListResponse]
      #
      # @see ModerationAPI::Models::AuthorListParams
      def list(params = {})
        parsed, options = ModerationAPI::AuthorListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "authors",
          query: parsed.transform_keys(
            content_types: "contentTypes",
            last_active_date: "lastActiveDate",
            member_since_date: "memberSinceDate",
            page_number: "pageNumber",
            page_size: "pageSize",
            sort_by: "sortBy",
            sort_direction: "sortDirection"
          ),
          model: ModerationAPI::Models::AuthorListResponse,
          options: options
        )
      end

      # Delete a specific author
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::AuthorDeleteResponse]
      #
      # @see ModerationAPI::Models::AuthorDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["authors/%1$s", id],
          model: ModerationAPI::Models::AuthorDeleteResponse,
          options: params[:request_options]
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
