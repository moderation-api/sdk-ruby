# typed: strong

module ModerationAPI
  module Models
    class AuthorListParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::AuthorListParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :content_types

      sig { params(content_types: String).void }
      attr_writer :content_types

      sig { returns(T.nilable(String)) }
      attr_reader :last_active_date

      sig { params(last_active_date: String).void }
      attr_writer :last_active_date

      sig { returns(T.nilable(String)) }
      attr_reader :member_since_date

      sig { params(member_since_date: String).void }
      attr_writer :member_since_date

      # Page number to fetch
      sig { returns(T.nilable(Float)) }
      attr_reader :page_number

      sig { params(page_number: Float).void }
      attr_writer :page_number

      # Number of authors per page
      sig { returns(T.nilable(Float)) }
      attr_reader :page_size

      sig { params(page_size: Float).void }
      attr_writer :page_size

      sig do
        returns(T.nilable(ModerationAPI::AuthorListParams::SortBy::OrSymbol))
      end
      attr_reader :sort_by

      sig do
        params(sort_by: ModerationAPI::AuthorListParams::SortBy::OrSymbol).void
      end
      attr_writer :sort_by

      # Sort direction
      sig do
        returns(
          T.nilable(ModerationAPI::AuthorListParams::SortDirection::OrSymbol)
        )
      end
      attr_reader :sort_direction

      sig do
        params(
          sort_direction:
            ModerationAPI::AuthorListParams::SortDirection::OrSymbol
        ).void
      end
      attr_writer :sort_direction

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            content_types: String,
            last_active_date: String,
            member_since_date: String,
            page_number: Float,
            page_size: Float,
            sort_by: ModerationAPI::AuthorListParams::SortBy::OrSymbol,
            sort_direction:
              ModerationAPI::AuthorListParams::SortDirection::OrSymbol,
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module SortBy
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::AuthorListParams::SortBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUST_LEVEL =
          T.let(
            :trustLevel,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        VIOLATION_COUNT =
          T.let(
            :violationCount,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        REPORT_COUNT =
          T.let(
            :reportCount,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        MEMBER_SINCE =
          T.let(
            :memberSince,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        LAST_ACTIVE =
          T.let(
            :lastActive,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        CONTENT_COUNT =
          T.let(
            :contentCount,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        FLAGGED_CONTENT_RATIO =
          T.let(
            :flaggedContentRatio,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )
        AVERAGE_SENTIMENT =
          T.let(
            :averageSentiment,
            ModerationAPI::AuthorListParams::SortBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ModerationAPI::AuthorListParams::SortBy::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Sort direction
      module SortDirection
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::AuthorListParams::SortDirection)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC =
          T.let(
            :asc,
            ModerationAPI::AuthorListParams::SortDirection::TaggedSymbol
          )
        DESC =
          T.let(
            :desc,
            ModerationAPI::AuthorListParams::SortDirection::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::AuthorListParams::SortDirection::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
