# typed: strong

module ModerationAPI
  module Models
    class QueueRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::QueueRetrieveResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig { returns(ModerationAPI::Models::QueueRetrieveResponse::Queue) }
      attr_reader :queue

      sig do
        params(
          queue: ModerationAPI::Models::QueueRetrieveResponse::Queue::OrHash
        ).void
      end
      attr_writer :queue

      sig do
        params(
          queue: ModerationAPI::Models::QueueRetrieveResponse::Queue::OrHash
        ).returns(T.attached_class)
      end
      def self.new(queue:)
      end

      sig do
        override.returns(
          { queue: ModerationAPI::Models::QueueRetrieveResponse::Queue }
        )
      end
      def to_hash
      end

      class Queue < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::QueueRetrieveResponse::Queue,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :description

        sig do
          returns(ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter)
        end
        attr_reader :filter

        sig do
          params(
            filter:
              ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::OrHash
          ).void
        end
        attr_writer :filter

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Float) }
        attr_accessor :resolved_items_count

        sig { returns(Float) }
        attr_accessor :total_items_count

        sig { returns(Float) }
        attr_accessor :unresolved_items_count

        sig do
          params(
            id: String,
            description: String,
            filter:
              ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::OrHash,
            name: String,
            resolved_items_count: Float,
            total_items_count: Float,
            unresolved_items_count: Float
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          description:,
          filter:,
          name:,
          resolved_items_count:,
          total_items_count:,
          unresolved_items_count:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              description: String,
              filter:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter,
              name: String,
              resolved_items_count: Float,
              total_items_count: Float,
              unresolved_items_count: Float
            }
          )
        end
        def to_hash
        end

        class Filter < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter,
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

          sig { returns(T.nilable(T::Array[T.nilable(String)])) }
          attr_reader :conversation_ids

          sig { params(conversation_ids: T::Array[T.nilable(String)]).void }
          attr_writer :conversation_ids

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :filtered_action_ids

          sig { params(filtered_action_ids: T::Array[String]).void }
          attr_writer :filtered_action_ids

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :filtered_channel_ids

          sig { params(filtered_channel_ids: T::Array[String]).void }
          attr_writer :filtered_channel_ids

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel
                ]
              )
            )
          end
          attr_reader :filter_labels

          sig do
            params(
              filter_labels:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::OrHash
                ]
            ).void
          end
          attr_writer :filter_labels

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :labels

          sig { params(labels: T::Array[String]).void }
          attr_writer :labels

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
                ]
              )
            )
          end
          attr_reader :recommendation_actions

          sig do
            params(
              recommendation_actions:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::OrSymbol
                ]
            ).void
          end
          attr_writer :recommendation_actions

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :show_checked

          sig { params(show_checked: T::Boolean).void }
          attr_writer :show_checked

          sig do
            params(
              after_date: String,
              author_id: String,
              before_date: String,
              conversation_ids: T::Array[T.nilable(String)],
              filtered_action_ids: T::Array[String],
              filtered_channel_ids: T::Array[String],
              filter_labels:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::OrHash
                ],
              labels: T::Array[String],
              recommendation_actions:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::OrSymbol
                ],
              show_checked: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            after_date: nil,
            author_id: nil,
            before_date: nil,
            conversation_ids: nil,
            filtered_action_ids: nil,
            filtered_channel_ids: nil,
            filter_labels: nil,
            labels: nil,
            recommendation_actions: nil,
            show_checked: nil
          )
          end

          sig do
            override.returns(
              {
                after_date: String,
                author_id: String,
                before_date: String,
                conversation_ids: T::Array[T.nilable(String)],
                filtered_action_ids: T::Array[String],
                filtered_channel_ids: T::Array[String],
                filter_labels:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel
                  ],
                labels: T::Array[String],
                recommendation_actions:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
                  ],
                show_checked: T::Boolean
              }
            )
          end
          def to_hash
          end

          class FilterLabel < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :label

            sig do
              returns(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig { returns(T.nilable(Float)) }
            attr_accessor :max_threshold

            sig { returns(T.nilable(Float)) }
            attr_accessor :min_threshold

            sig do
              params(
                label: String,
                type:
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::OrSymbol,
                max_threshold: T.nilable(Float),
                min_threshold: T.nilable(Float)
              ).returns(T.attached_class)
            end
            def self.new(label:, type:, max_threshold: nil, min_threshold: nil)
            end

            sig do
              override.returns(
                {
                  label: String,
                  type:
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol,
                  max_threshold: T.nilable(Float),
                  min_threshold: T.nilable(Float)
                }
              )
            end
            def to_hash
            end

            module Type
              extend ModerationAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FLAGGED =
                T.let(
                  :FLAGGED,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol
                )
              NOT_FLAGGED =
                T.let(
                  :NOT_FLAGGED,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol
                )
              THRESHOLDS =
                T.let(
                  :THRESHOLDS,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          module RecommendationAction
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REVIEW =
              T.let(
                :review,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
              )
            ALLOW =
              T.let(
                :allow,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
              )
            REJECT =
              T.let(
                :reject,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
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
end
