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

          sig { returns(T.nilable(T::Array[Integer])) }
          attr_reader :author_trust_levels

          sig { params(author_trust_levels: T::Array[Integer]).void }
          attr_writer :author_trust_levels

          sig { returns(T.nilable(String)) }
          attr_reader :before_date

          sig { params(before_date: String).void }
          attr_writer :before_date

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol
              )
            )
          end
          attr_reader :casebook_agreement

          sig do
            params(
              casebook_agreement:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::OrSymbol
            ).void
          end
          attr_writer :casebook_agreement

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
              )
            )
          end
          attr_reader :casebook_answer

          sig do
            params(
              casebook_answer:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::OrSymbol
            ).void
          end
          attr_writer :casebook_answer

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
              )
            )
          end
          attr_accessor :check_status

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :clear_date_window

          sig { params(clear_date_window: T::Boolean).void }
          attr_writer :clear_date_window

          sig { returns(T.nilable(String)) }
          attr_reader :content_id

          sig { params(content_id: String).void }
          attr_writer :content_id

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
                ]
              )
            )
          end
          attr_reader :content_types

          sig do
            params(
              content_types:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::OrSymbol
                ]
            ).void
          end
          attr_writer :content_types

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

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
              )
            )
          end
          attr_reader :is_flagged

          sig do
            params(
              is_flagged:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::OrSymbol
            ).void
          end
          attr_writer :is_flagged

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :labels

          sig { params(labels: T::Array[String]).void }
          attr_writer :labels

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :languages

          sig { params(languages: T::Array[String]).void }
          attr_writer :languages

          sig { returns(T.nilable(Integer)) }
          attr_reader :max_severity

          sig { params(max_severity: Integer).void }
          attr_writer :max_severity

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
                ]
              )
            )
          end
          attr_reader :media_types

          sig do
            params(
              media_types:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::OrSymbol
                ]
            ).void
          end
          attr_writer :media_types

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MetadataFilter
                ]
              )
            )
          end
          attr_reader :metadata_filters

          sig do
            params(
              metadata_filters:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MetadataFilter::OrHash
                ]
            ).void
          end
          attr_writer :metadata_filters

          sig { returns(T.nilable(Integer)) }
          attr_reader :min_severity

          sig { params(min_severity: Integer).void }
          attr_writer :min_severity

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

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :search

          sig { params(search: T::Array[String]).void }
          attr_writer :search

          sig { returns(T.nilable(Float)) }
          attr_reader :within

          sig { params(within: Float).void }
          attr_writer :within

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            )
          end
          attr_reader :within_unit

          sig do
            params(
              within_unit:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::OrSymbol
            ).void
          end
          attr_writer :within_unit

          sig do
            params(
              after_date: String,
              author_id: String,
              author_trust_levels: T::Array[Integer],
              before_date: String,
              casebook_agreement:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::OrSymbol,
              casebook_answer:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::OrSymbol,
              check_status:
                T.nilable(
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::OrSymbol
                ),
              clear_date_window: T::Boolean,
              content_id: String,
              content_types:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::OrSymbol
                ],
              conversation_ids: T::Array[T.nilable(String)],
              filtered_action_ids: T::Array[String],
              filtered_channel_ids: T::Array[String],
              filter_labels:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel::OrHash
                ],
              is_flagged:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::OrSymbol,
              labels: T::Array[String],
              languages: T::Array[String],
              max_severity: Integer,
              media_types:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::OrSymbol
                ],
              metadata_filters:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MetadataFilter::OrHash
                ],
              min_severity: Integer,
              recommendation_actions:
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::OrSymbol
                ],
              search: T::Array[String],
              within: Float,
              within_unit:
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            after_date: nil,
            author_id: nil,
            author_trust_levels: nil,
            before_date: nil,
            casebook_agreement: nil,
            casebook_answer: nil,
            check_status: nil,
            clear_date_window: nil,
            content_id: nil,
            content_types: nil,
            conversation_ids: nil,
            filtered_action_ids: nil,
            filtered_channel_ids: nil,
            filter_labels: nil,
            is_flagged: nil,
            labels: nil,
            languages: nil,
            max_severity: nil,
            media_types: nil,
            metadata_filters: nil,
            min_severity: nil,
            recommendation_actions: nil,
            search: nil,
            within: nil,
            within_unit: nil
          )
          end

          sig do
            override.returns(
              {
                after_date: String,
                author_id: String,
                author_trust_levels: T::Array[Integer],
                before_date: String,
                casebook_agreement:
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol,
                casebook_answer:
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol,
                check_status:
                  T.nilable(
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
                  ),
                clear_date_window: T::Boolean,
                content_id: String,
                content_types:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
                  ],
                conversation_ids: T::Array[T.nilable(String)],
                filtered_action_ids: T::Array[String],
                filtered_channel_ids: T::Array[String],
                filter_labels:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::FilterLabel
                  ],
                is_flagged:
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol,
                labels: T::Array[String],
                languages: T::Array[String],
                max_severity: Integer,
                media_types:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
                  ],
                metadata_filters:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MetadataFilter
                  ],
                min_severity: Integer,
                recommendation_actions:
                  T::Array[
                    ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::RecommendationAction::TaggedSymbol
                  ],
                search: T::Array[String],
                within: Float,
                within_unit:
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module CasebookAgreement
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :ALL,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol
              )
            OVERRULED =
              T.let(
                :OVERRULED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol
              )
            AGREED =
              T.let(
                :AGREED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAgreement::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module CasebookAnswer
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :ALL,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
              )
            ALLOWED =
              T.let(
                :ALLOWED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
              )
            REJECTED =
              T.let(
                :REJECTED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
              )
            NO_ANSWER =
              T.let(
                :NO_ANSWER,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CasebookAnswer::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module CheckStatus
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
              )
            CHECKED =
              T.let(
                :checked,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
              )
            UNCHECKED =
              T.let(
                :unchecked,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::CheckStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module ContentType
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROFILE =
              T.let(
                :profile,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            MESSAGE =
              T.let(
                :message,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            POST =
              T.let(
                :post,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            COMMENT =
              T.let(
                :comment,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            EVENT =
              T.let(
                :event,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            PRODUCT =
              T.let(
                :product,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            REVIEW =
              T.let(
                :review,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            VOICE =
              T.let(
                :voice,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::ContentType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
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
              MATCHED =
                T.let(
                  :MATCHED,
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

          module IsFlagged
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :ALL,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
              )
            FLAGGED =
              T.let(
                :FLAGGED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
              )
            NOT_FLAGGED =
              T.let(
                :NOT_FLAGGED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
              )
            SHADOW_FLAGGED =
              T.let(
                :SHADOW_FLAGGED,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::IsFlagged::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module MediaType
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
              )
            OBJECT =
              T.let(
                :object,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
              )
            AUDIO =
              T.let(
                :audio,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MediaType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class MetadataFilter < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::MetadataFilter,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :key

            sig { returns(String) }
            attr_accessor :value

            sig { params(key: String, value: String).returns(T.attached_class) }
            def self.new(key:, value:)
            end

            sig { override.returns({ key: String, value: String }) }
            def to_hash
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

          module WithinUnit
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :MINUTES,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            HOURS =
              T.let(
                :HOURS,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            DAYS =
              T.let(
                :DAYS,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            WEEKS =
              T.let(
                :WEEKS,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            MONTHS =
              T.let(
                :MONTHS,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )
            YEARS =
              T.let(
                :YEARS,
                ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::QueueRetrieveResponse::Queue::Filter::WithinUnit::TaggedSymbol
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
