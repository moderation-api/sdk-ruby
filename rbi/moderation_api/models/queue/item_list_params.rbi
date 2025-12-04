# typed: strong

module ModerationAPI
  module Models
    module Queue
      class ItemListParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Queue::ItemListParams,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :after_date

        sig { params(after_date: String).void }
        attr_writer :after_date

        sig { returns(T.nilable(String)) }
        attr_reader :author_id

        sig { params(author_id: String).void }
        attr_writer :author_id

        sig { returns(T.nilable(String)) }
        attr_reader :before_date

        sig { params(before_date: String).void }
        attr_writer :before_date

        sig { returns(T.nilable(String)) }
        attr_reader :conversation_ids

        sig { params(conversation_ids: String).void }
        attr_writer :conversation_ids

        sig { returns(T.nilable(String)) }
        attr_reader :filtered_action_ids

        sig { params(filtered_action_ids: String).void }
        attr_writer :filtered_action_ids

        sig { returns(T.nilable(String)) }
        attr_reader :include_resolved

        sig { params(include_resolved: String).void }
        attr_writer :include_resolved

        sig { returns(T.nilable(String)) }
        attr_reader :labels

        sig { params(labels: String).void }
        attr_writer :labels

        # Page number to fetch
        sig { returns(T.nilable(Float)) }
        attr_reader :page_number

        sig { params(page_number: Float).void }
        attr_writer :page_number

        # Number of items per page
        sig { returns(T.nilable(Float)) }
        attr_reader :page_size

        sig { params(page_size: Float).void }
        attr_writer :page_size

        # Sort direction
        sig do
          returns(
            T.nilable(
              ModerationAPI::Queue::ItemListParams::SortDirection::OrSymbol
            )
          )
        end
        attr_reader :sort_direction

        sig do
          params(
            sort_direction:
              ModerationAPI::Queue::ItemListParams::SortDirection::OrSymbol
          ).void
        end
        attr_writer :sort_direction

        sig do
          returns(
            T.nilable(ModerationAPI::Queue::ItemListParams::SortField::OrSymbol)
          )
        end
        attr_reader :sort_field

        sig do
          params(
            sort_field:
              ModerationAPI::Queue::ItemListParams::SortField::OrSymbol
          ).void
        end
        attr_writer :sort_field

        sig do
          params(
            after_date: String,
            author_id: String,
            before_date: String,
            conversation_ids: String,
            filtered_action_ids: String,
            include_resolved: String,
            labels: String,
            page_number: Float,
            page_size: Float,
            sort_direction:
              ModerationAPI::Queue::ItemListParams::SortDirection::OrSymbol,
            sort_field:
              ModerationAPI::Queue::ItemListParams::SortField::OrSymbol,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              after_date: String,
              author_id: String,
              before_date: String,
              conversation_ids: String,
              filtered_action_ids: String,
              include_resolved: String,
              labels: String,
              page_number: Float,
              page_size: Float,
              sort_direction:
                ModerationAPI::Queue::ItemListParams::SortDirection::OrSymbol,
              sort_field:
                ModerationAPI::Queue::ItemListParams::SortField::OrSymbol,
              request_options: ModerationAPI::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Sort direction
        module SortDirection
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ModerationAPI::Queue::ItemListParams::SortDirection)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ASC =
            T.let(
              :asc,
              ModerationAPI::Queue::ItemListParams::SortDirection::TaggedSymbol
            )
          DESC =
            T.let(
              :desc,
              ModerationAPI::Queue::ItemListParams::SortDirection::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Queue::ItemListParams::SortDirection::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module SortField
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ModerationAPI::Queue::ItemListParams::SortField)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATED_AT =
            T.let(
              :createdAt,
              ModerationAPI::Queue::ItemListParams::SortField::TaggedSymbol
            )
          SEVERITY =
            T.let(
              :severity,
              ModerationAPI::Queue::ItemListParams::SortField::TaggedSymbol
            )
          REVIEWED_AT =
            T.let(
              :reviewedAt,
              ModerationAPI::Queue::ItemListParams::SortField::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Queue::ItemListParams::SortField::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
