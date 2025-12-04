# typed: strong

module ModerationAPI
  module Resources
    class Authors
      # Create a new author. Typically not needed as authors are created automatically
      # when content is moderated.
      sig do
        params(
          external_id: String,
          email: T.nilable(String),
          external_link: T.nilable(String),
          first_seen: Float,
          last_seen: Float,
          manual_trust_level: T.nilable(Float),
          metadata: ModerationAPI::AuthorCreateParams::Metadata::OrHash,
          name: T.nilable(String),
          profile_picture: T.nilable(String),
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::AuthorCreateResponse)
      end
      def create(
        # External ID of the user, typically the ID of the author in your database.
        external_id:,
        # Author email address
        email: nil,
        # URL of the author's external profile
        external_link: nil,
        # Timestamp when author first appeared
        first_seen: nil,
        # Timestamp of last activity
        last_seen: nil,
        manual_trust_level: nil,
        # Additional metadata provided by your system. We recommend including any relevant
        # information that may assist in the moderation process.
        metadata: nil,
        # Author name or identifier
        name: nil,
        # URL of the author's profile picture
        profile_picture: nil,
        request_options: {}
      )
      end

      # Get detailed information about a specific author including historical data and
      # analysis
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::AuthorRetrieveResponse)
      end
      def retrieve(
        # Either external ID or the ID assigned by moderation API.
        id,
        request_options: {}
      )
      end

      # Update the details of a specific author
      sig do
        params(
          id: String,
          email: T.nilable(String),
          external_link: T.nilable(String),
          first_seen: Float,
          last_seen: Float,
          manual_trust_level: T.nilable(Float),
          metadata: ModerationAPI::AuthorUpdateParams::Metadata::OrHash,
          name: T.nilable(String),
          profile_picture: T.nilable(String),
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::AuthorUpdateResponse)
      end
      def update(
        # Either external ID or the ID assigned by moderation API.
        id,
        # Author email address
        email: nil,
        # URL of the author's external profile
        external_link: nil,
        # Timestamp when author first appeared
        first_seen: nil,
        # Timestamp of last activity
        last_seen: nil,
        manual_trust_level: nil,
        # Additional metadata provided by your system. We recommend including any relevant
        # information that may assist in the moderation process.
        metadata: nil,
        # Author name or identifier
        name: nil,
        # URL of the author's profile picture
        profile_picture: nil,
        request_options: {}
      )
      end

      # Get a paginated list of authors with their activity metrics and reputation
      sig do
        params(
          content_types: String,
          last_active_date: String,
          member_since_date: String,
          page_number: Float,
          page_size: Float,
          sort_by: ModerationAPI::AuthorListParams::SortBy::OrSymbol,
          sort_direction:
            ModerationAPI::AuthorListParams::SortDirection::OrSymbol,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::AuthorListResponse)
      end
      def list(
        content_types: nil,
        last_active_date: nil,
        member_since_date: nil,
        # Page number to fetch
        page_number: nil,
        # Number of authors per page
        page_size: nil,
        sort_by: nil,
        # Sort direction
        sort_direction: nil,
        request_options: {}
      )
      end

      # Delete a specific author
      sig do
        params(
          id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(ModerationAPI::Models::AuthorDeleteResponse)
      end
      def delete(id, request_options: {})
      end

      # @api private
      sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
