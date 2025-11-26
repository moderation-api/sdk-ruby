# typed: strong

module ModerationAPI
  module Models
    module Queue
      class ItemListResponse < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::Queue::ItemListResponse,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[ModerationAPI::Models::Queue::ItemListResponse::Item]
          )
        end
        attr_accessor :items

        sig do
          returns(ModerationAPI::Models::Queue::ItemListResponse::Pagination)
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              ModerationAPI::Models::Queue::ItemListResponse::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        sig do
          params(
            items:
              T::Array[
                ModerationAPI::Models::Queue::ItemListResponse::Item::OrHash
              ],
            pagination:
              ModerationAPI::Models::Queue::ItemListResponse::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(items:, pagination:)
        end

        sig do
          override.returns(
            {
              items:
                T::Array[ModerationAPI::Models::Queue::ItemListResponse::Item],
              pagination:
                ModerationAPI::Models::Queue::ItemListResponse::Pagination
            }
          )
        end
        def to_hash
        end

        class Item < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::Queue::ItemListResponse::Item,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Content ID
          sig { returns(String) }
          attr_accessor :id

          # The content to be moderated
          sig { returns(String) }
          attr_accessor :content

          # Whether the item is flagged by any label
          sig { returns(T::Boolean) }
          attr_accessor :flagged

          sig do
            returns(
              T::Array[
                ModerationAPI::Models::Queue::ItemListResponse::Item::Label
              ]
            )
          end
          attr_accessor :labels

          # Status of the item
          sig do
            returns(
              ModerationAPI::Models::Queue::ItemListResponse::Item::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # Unix timestamp of when the item was created
          sig { returns(Float) }
          attr_accessor :timestamp

          # Action IDs taken on this item
          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Action
                ]
              )
            )
          end
          attr_reader :actions

          sig do
            params(
              actions:
                T::Array[
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Action::OrHash
                ]
            ).void
          end
          attr_writer :actions

          # Author ID
          sig { returns(T.nilable(String)) }
          attr_reader :author_id

          sig { params(author_id: String).void }
          attr_writer :author_id

          # Type of the content object
          sig { returns(T.nilable(String)) }
          attr_reader :content_type

          sig { params(content_type: String).void }
          attr_writer :content_type

          # Conversation ID
          sig { returns(T.nilable(String)) }
          attr_reader :conversation_id

          sig { params(conversation_id: String).void }
          attr_writer :conversation_id

          # Content language
          sig { returns(T.nilable(String)) }
          attr_reader :language

          sig { params(language: String).void }
          attr_writer :language

          sig do
            params(
              id: String,
              content: String,
              flagged: T::Boolean,
              labels:
                T::Array[
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Label::OrHash
                ],
              status:
                ModerationAPI::Models::Queue::ItemListResponse::Item::Status::OrSymbol,
              timestamp: Float,
              actions:
                T::Array[
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Action::OrHash
                ],
              author_id: String,
              content_type: String,
              conversation_id: String,
              language: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Content ID
            id:,
            # The content to be moderated
            content:,
            # Whether the item is flagged by any label
            flagged:,
            labels:,
            # Status of the item
            status:,
            # Unix timestamp of when the item was created
            timestamp:,
            # Action IDs taken on this item
            actions: nil,
            # Author ID
            author_id: nil,
            # Type of the content object
            content_type: nil,
            # Conversation ID
            conversation_id: nil,
            # Content language
            language: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content: String,
                flagged: T::Boolean,
                labels:
                  T::Array[
                    ModerationAPI::Models::Queue::ItemListResponse::Item::Label
                  ],
                status:
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Status::TaggedSymbol,
                timestamp: Float,
                actions:
                  T::Array[
                    ModerationAPI::Models::Queue::ItemListResponse::Item::Action
                  ],
                author_id: String,
                content_type: String,
                conversation_id: String,
                language: String
              }
            )
          end
          def to_hash
          end

          class Label < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Label,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Whether this label caused a flag
            sig { returns(T::Boolean) }
            attr_accessor :flagged

            # Label name
            sig { returns(String) }
            attr_accessor :label

            # Confidence score of the label
            sig { returns(Float) }
            attr_accessor :score

            sig do
              params(flagged: T::Boolean, label: String, score: Float).returns(
                T.attached_class
              )
            end
            def self.new(
              # Whether this label caused a flag
              flagged:,
              # Label name
              label:,
              # Confidence score of the label
              score:
            )
            end

            sig do
              override.returns(
                { flagged: T::Boolean, label: String, score: Float }
              )
            end
            def to_hash
            end
          end

          # Status of the item
          module Status
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :pending,
                ModerationAPI::Models::Queue::ItemListResponse::Item::Status::TaggedSymbol
              )
            RESOLVED =
              T.let(
                :resolved,
                ModerationAPI::Models::Queue::ItemListResponse::Item::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Action < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::Queue::ItemListResponse::Item::Action,
                  ModerationAPI::Internal::AnyHash
                )
              end

            # Action ID
            sig { returns(String) }
            attr_accessor :id

            # Action name
            sig { returns(String) }
            attr_accessor :name

            # Unix timestamp of when the action was taken
            sig { returns(Float) }
            attr_accessor :timestamp

            # Action comment
            sig { returns(T.nilable(String)) }
            attr_reader :comment

            sig { params(comment: String).void }
            attr_writer :comment

            # Moderator userID
            sig { returns(T.nilable(String)) }
            attr_reader :reviewer

            sig { params(reviewer: String).void }
            attr_writer :reviewer

            sig do
              params(
                id: String,
                name: String,
                timestamp: Float,
                comment: String,
                reviewer: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Action ID
              id:,
              # Action name
              name:,
              # Unix timestamp of when the action was taken
              timestamp:,
              # Action comment
              comment: nil,
              # Moderator userID
              reviewer: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  name: String,
                  timestamp: Float,
                  comment: String,
                  reviewer: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class Pagination < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::Queue::ItemListResponse::Pagination,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Float) }
          attr_accessor :current_page

          sig { returns(T::Boolean) }
          attr_accessor :has_next_page

          sig { returns(T::Boolean) }
          attr_accessor :has_previous_page

          sig { returns(Float) }
          attr_accessor :total_items

          sig { returns(Float) }
          attr_accessor :total_pages

          sig do
            params(
              current_page: Float,
              has_next_page: T::Boolean,
              has_previous_page: T::Boolean,
              total_items: Float,
              total_pages: Float
            ).returns(T.attached_class)
          end
          def self.new(
            current_page:,
            has_next_page:,
            has_previous_page:,
            total_items:,
            total_pages:
          )
          end

          sig do
            override.returns(
              {
                current_page: Float,
                has_next_page: T::Boolean,
                has_previous_page: T::Boolean,
                total_items: Float,
                total_pages: Float
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
