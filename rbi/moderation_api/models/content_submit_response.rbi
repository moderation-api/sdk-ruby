# typed: strong

module ModerationAPI
  module Models
    class ContentSubmitResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ContentSubmitResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The author of the content if your account has authors enabled. Requires you to
      # send authorId when submitting content.
      sig do
        returns(T.nilable(ModerationAPI::Models::ContentSubmitResponse::Author))
      end
      attr_reader :author

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ContentSubmitResponse::Author::OrHash
            )
        ).void
      end
      attr_writer :author

      # Potentially modified content.
      sig { returns(ModerationAPI::Models::ContentSubmitResponse::Content) }
      attr_reader :content

      sig do
        params(
          content: ModerationAPI::Models::ContentSubmitResponse::Content::OrHash
        ).void
      end
      attr_writer :content

      # The evaluation of the content after running the channel policies.
      sig { returns(ModerationAPI::Models::ContentSubmitResponse::Evaluation) }
      attr_reader :evaluation

      sig do
        params(
          evaluation:
            ModerationAPI::Models::ContentSubmitResponse::Evaluation::OrHash
        ).void
      end
      attr_writer :evaluation

      # Results of all insights enabled in the channel.
      sig do
        returns(
          T::Array[
            ModerationAPI::Models::ContentSubmitResponse::Insight::Variants
          ]
        )
      end
      attr_accessor :insights

      # Metadata about the moderation request
      sig { returns(ModerationAPI::Models::ContentSubmitResponse::Meta) }
      attr_reader :meta

      sig do
        params(
          meta: ModerationAPI::Models::ContentSubmitResponse::Meta::OrHash
        ).void
      end
      attr_writer :meta

      # Results of all policies in the channel. Sorted by highest probability.
      sig do
        returns(
          T::Array[
            ModerationAPI::Models::ContentSubmitResponse::Policy::Variants
          ]
        )
      end
      attr_accessor :policies

      # The recommendation for the content based on the evaluation.
      sig do
        returns(ModerationAPI::Models::ContentSubmitResponse::Recommendation)
      end
      attr_reader :recommendation

      sig do
        params(
          recommendation:
            ModerationAPI::Models::ContentSubmitResponse::Recommendation::OrHash
        ).void
      end
      attr_writer :recommendation

      # Policies that had errors
      sig do
        returns(
          T.nilable(
            T::Array[ModerationAPI::Models::ContentSubmitResponse::Error]
          )
        )
      end
      attr_reader :errors

      sig do
        params(
          errors:
            T::Array[
              ModerationAPI::Models::ContentSubmitResponse::Error::OrHash
            ]
        ).void
      end
      attr_writer :errors

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ContentSubmitResponse::Author::OrHash
            ),
          content:
            ModerationAPI::Models::ContentSubmitResponse::Content::OrHash,
          evaluation:
            ModerationAPI::Models::ContentSubmitResponse::Evaluation::OrHash,
          insights:
            T::Array[
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::OrHash,
                ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight::OrHash
              )
            ],
          meta: ModerationAPI::Models::ContentSubmitResponse::Meta::OrHash,
          policies:
            T::Array[
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::OrHash,
                ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::OrHash
              )
            ],
          recommendation:
            ModerationAPI::Models::ContentSubmitResponse::Recommendation::OrHash,
          errors:
            T::Array[
              ModerationAPI::Models::ContentSubmitResponse::Error::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        author:,
        # Potentially modified content.
        content:,
        # The evaluation of the content after running the channel policies.
        evaluation:,
        # Results of all insights enabled in the channel.
        insights:,
        # Metadata about the moderation request
        meta:,
        # Results of all policies in the channel. Sorted by highest probability.
        policies:,
        # The recommendation for the content based on the evaluation.
        recommendation:,
        # Policies that had errors
        errors: nil
      )
      end

      sig do
        override.returns(
          {
            author:
              T.nilable(ModerationAPI::Models::ContentSubmitResponse::Author),
            content: ModerationAPI::Models::ContentSubmitResponse::Content,
            evaluation:
              ModerationAPI::Models::ContentSubmitResponse::Evaluation,
            insights:
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Insight::Variants
              ],
            meta: ModerationAPI::Models::ContentSubmitResponse::Meta,
            policies:
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Policy::Variants
              ],
            recommendation:
              ModerationAPI::Models::ContentSubmitResponse::Recommendation,
            errors:
              T::Array[ModerationAPI::Models::ContentSubmitResponse::Error]
          }
        )
      end
      def to_hash
      end

      class Author < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Author,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Author ID in Moderation API
        sig { returns(String) }
        attr_accessor :id

        # Block or suspension details, if applicable. Null if the author is enabled.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ContentSubmitResponse::Author::Block
            )
          )
        end
        attr_reader :block

        sig do
          params(
            block:
              T.nilable(
                ModerationAPI::Models::ContentSubmitResponse::Author::Block::OrHash
              )
          ).void
        end
        attr_writer :block

        # Current author status
        sig do
          returns(
            ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel
          )
        end
        attr_reader :trust_level

        sig do
          params(
            trust_level:
              ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel::OrHash
          ).void
        end
        attr_writer :trust_level

        # The author's ID from your system
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        sig do
          params(
            id: String,
            block:
              T.nilable(
                ModerationAPI::Models::ContentSubmitResponse::Author::Block::OrHash
              ),
            status:
              ModerationAPI::Models::ContentSubmitResponse::Author::Status::OrSymbol,
            trust_level:
              ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel::OrHash,
            external_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Author ID in Moderation API
          id:,
          # Block or suspension details, if applicable. Null if the author is enabled.
          block:,
          # Current author status
          status:,
          trust_level:,
          # The author's ID from your system
          external_id: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              block:
                T.nilable(
                  ModerationAPI::Models::ContentSubmitResponse::Author::Block
                ),
              status:
                ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol,
              trust_level:
                ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel,
              external_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Block < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Author::Block,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The moderators reason why the author was blocked or suspended.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # The timestamp until which they are blocked if the author is suspended.
          sig { returns(T.nilable(Float)) }
          attr_accessor :until_

          # Block or suspension details, if applicable. Null if the author is enabled.
          sig do
            params(reason: T.nilable(String), until_: T.nilable(Float)).returns(
              T.attached_class
            )
          end
          def self.new(
            # The moderators reason why the author was blocked or suspended.
            reason: nil,
            # The timestamp until which they are blocked if the author is suspended.
            until_: nil
          )
          end

          sig do
            override.returns(
              { reason: T.nilable(String), until_: T.nilable(Float) }
            )
          end
          def to_hash
          end
        end

        # Current author status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ContentSubmitResponse::Author::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Author::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrustLevel < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Author::TrustLevel,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Author trust level (-1, 0, 1, 2, 3, or 4)
          sig { returns(Float) }
          attr_accessor :level

          # True if the trust level was set manually by a moderator
          sig { returns(T::Boolean) }
          attr_accessor :manual

          sig do
            params(level: Float, manual: T::Boolean).returns(T.attached_class)
          end
          def self.new(
            # Author trust level (-1, 0, 1, 2, 3, or 4)
            level:,
            # True if the trust level was set manually by a moderator
            manual:
          )
          end

          sig { override.returns({ level: Float, manual: T::Boolean }) }
          def to_hash
          end
        end
      end

      class Content < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Content,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The unique identifier for the content. Either the contentId provided by you or
        # an autogenerated ID.
        sig { returns(String) }
        attr_accessor :id

        # Whether any values have been masked.
        sig { returns(T::Boolean) }
        attr_accessor :masked

        # The modified content, if any.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ContentSubmitResponse::Content::Modified::Variants
            )
          )
        end
        attr_accessor :modified

        # Potentially modified content.
        sig do
          params(
            id: String,
            masked: T::Boolean,
            modified:
              T.nilable(
                ModerationAPI::Models::ContentSubmitResponse::Content::Modified::Variants
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier for the content. Either the contentId provided by you or
          # an autogenerated ID.
          id:,
          # Whether any values have been masked.
          masked:,
          # The modified content, if any.
          modified:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              masked: T::Boolean,
              modified:
                T.nilable(
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::Variants
                )
            }
          )
        end
        def to_hash
        end

        # The modified content, if any.
        module Modified
          extend ModerationAPI::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Hash[
                  Symbol,
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Variants
                ]
              )
            end

          # Text
          module UnionMember1
            extend ModerationAPI::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Text,
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Image,
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Video,
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Audio
                )
              end

            class Text < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Text,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # The content text
              sig { returns(String) }
              attr_accessor :text

              sig { returns(Symbol) }
              attr_accessor :type

              # Text
              sig do
                params(text: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # The content text
                text:,
                type: :text
              )
              end

              sig { override.returns({ text: String, type: Symbol }) }
              def to_hash
              end
            end

            class Image < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Image,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # A public URL of the image content
              sig { returns(String) }
              attr_accessor :url

              # Image
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # A public URL of the image content
                url:,
                type: :image
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            class Video < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Video,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # A public URL of the video content
              sig { returns(String) }
              attr_accessor :url

              # Video
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # A public URL of the video content
                url:,
                type: :video
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            class Audio < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Audio,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # The URL of the audio content
              sig { returns(String) }
              attr_accessor :url

              # Audio
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # The URL of the audio content
                url:,
                type: :audio
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Content::Modified::Variants
              ]
            )
          end
          def self.variants
          end

          UnionMember1Map =
            T.let(
              ModerationAPI::Internal::Type::HashOf[
                union:
                  ModerationAPI::Models::ContentSubmitResponse::Content::Modified::UnionMember1
              ],
              ModerationAPI::Internal::Type::Converter
            )
        end
      end

      class Evaluation < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Evaluation,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The probability that the content should be flagged.
        sig { returns(Float) }
        attr_accessor :flag_probability

        # Whether the content was flagged by any policy.
        sig { returns(T::Boolean) }
        attr_accessor :flagged

        # The severity score of the content. A higher score indicates more severe content.
        sig { returns(Float) }
        attr_accessor :severity_score

        # Whether the content was flagged for Unicode spoofing.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :unicode_spoofed

        sig { params(unicode_spoofed: T::Boolean).void }
        attr_writer :unicode_spoofed

        # The evaluation of the content after running the channel policies.
        sig do
          params(
            flag_probability: Float,
            flagged: T::Boolean,
            severity_score: Float,
            unicode_spoofed: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The probability that the content should be flagged.
          flag_probability:,
          # Whether the content was flagged by any policy.
          flagged:,
          # The severity score of the content. A higher score indicates more severe content.
          severity_score:,
          # Whether the content was flagged for Unicode spoofing.
          unicode_spoofed: nil
        )
        end

        sig do
          override.returns(
            {
              flag_probability: Float,
              flagged: T::Boolean,
              severity_score: Float,
              unicode_spoofed: T::Boolean
            }
          )
        end
        def to_hash
        end
      end

      # Sentiment insight
      module Insight
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight,
              ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight
            )
          end

        class SentimentInsight < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(Float) }
          attr_accessor :probability

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
              )
            )
          end
          attr_accessor :value

          # Sentiment insight
          sig do
            params(
              probability: Float,
              value:
                T.nilable(
                  ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::OrSymbol
                ),
              id: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(probability:, value:, id: :sentiment, type: :insight)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                probability: Float,
                type: Symbol,
                value:
                  T.nilable(
                    ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
                  )
              }
            )
          end
          def to_hash
          end

          module Value
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            POSITIVE =
              T.let(
                :positive,
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
              )
            NEUTRAL =
              T.let(
                :neutral,
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
              )
            NEGATIVE =
              T.let(
                :negative,
                ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Insight::SentimentInsight::Value::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class LanguageInsight < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Insight::LanguageInsight,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(Float) }
          attr_accessor :probability

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_accessor :value

          # Language insight
          sig do
            params(
              probability: Float,
              value: T.nilable(String),
              id: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(probability:, value:, id: :language, type: :insight)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                probability: Float,
                type: Symbol,
                value: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::ContentSubmitResponse::Insight::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class Meta < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Meta,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The unique key of the channel where the content was handled. Either the channel
        # provided by you or automatically routed.
        sig { returns(String) }
        attr_accessor :channel_key

        sig do
          returns(
            ModerationAPI::Models::ContentSubmitResponse::Meta::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(Float) }
        attr_accessor :timestamp

        sig { returns(Float) }
        attr_accessor :usage

        sig { returns(T.nilable(String)) }
        attr_reader :processing_time

        sig { params(processing_time: String).void }
        attr_writer :processing_time

        # Metadata about the moderation request
        sig do
          params(
            channel_key: String,
            status:
              ModerationAPI::Models::ContentSubmitResponse::Meta::Status::OrSymbol,
            timestamp: Float,
            usage: Float,
            processing_time: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique key of the channel where the content was handled. Either the channel
          # provided by you or automatically routed.
          channel_key:,
          status:,
          timestamp:,
          usage:,
          processing_time: nil
        )
        end

        sig do
          override.returns(
            {
              channel_key: String,
              status:
                ModerationAPI::Models::ContentSubmitResponse::Meta::Status::TaggedSymbol,
              timestamp: Float,
              usage: Float,
              processing_time: String
            }
          )
        end
        def to_hash
        end

        module Status
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ContentSubmitResponse::Meta::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              ModerationAPI::Models::ContentSubmitResponse::Meta::Status::TaggedSymbol
            )
          PARTIAL_SUCCESS =
            T.let(
              :partial_success,
              ModerationAPI::Models::ContentSubmitResponse::Meta::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Meta::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Policy output schema.
      module Policy
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput,
              ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput
            )
          end

        class ClassifierOutput < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The unique identifier for the classifier output.
          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flagged

          sig { returns(Float) }
          attr_accessor :probability

          sig { returns(Symbol) }
          attr_accessor :type

          # The keys of the flagged fields if submitting an object.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :flagged_fields

          sig { params(flagged_fields: T::Array[String]).void }
          attr_writer :flagged_fields

          sig do
            returns(
              T.nilable(
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label
                ]
              )
            )
          end
          attr_reader :labels

          sig do
            params(
              labels:
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label::OrHash
                ]
            ).void
          end
          attr_writer :labels

          # Classifier policy.
          sig do
            params(
              id: String,
              flagged: T::Boolean,
              probability: Float,
              flagged_fields: T::Array[String],
              labels:
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label::OrHash
                ],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique identifier for the classifier output.
            id:,
            flagged:,
            probability:,
            # The keys of the flagged fields if submitting an object.
            flagged_fields: nil,
            labels: nil,
            type: :classifier
          )
          end

          sig do
            override.returns(
              {
                id: String,
                flagged: T::Boolean,
                probability: Float,
                type: Symbol,
                flagged_fields: T::Array[String],
                labels:
                  T::Array[
                    ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label
                  ]
              }
            )
          end
          def to_hash
          end

          class Label < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::ContentSubmitResponse::Policy::ClassifierOutput::Label,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(T::Boolean) }
            attr_accessor :flagged

            sig { returns(Float) }
            attr_accessor :probability

            sig do
              params(
                id: String,
                flagged: T::Boolean,
                probability: Float
              ).returns(T.attached_class)
            end
            def self.new(id:, flagged:, probability:)
            end

            sig do
              override.returns(
                { id: String, flagged: T::Boolean, probability: Float }
              )
            end
            def to_hash
            end
          end
        end

        class EntityMatcherOutput < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flagged

          sig do
            returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match
              ]
            )
          end
          attr_accessor :matches

          sig { returns(Float) }
          attr_accessor :probability

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :flagged_fields

          sig { params(flagged_fields: T::Array[String]).void }
          attr_writer :flagged_fields

          # Entity matcher policy.
          sig do
            params(
              id: String,
              flagged: T::Boolean,
              matches:
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match::OrHash
                ],
              probability: Float,
              flagged_fields: T::Array[String],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            flagged:,
            matches:,
            probability:,
            flagged_fields: nil,
            type: :entity_matcher
          )
          end

          sig do
            override.returns(
              {
                id: String,
                flagged: T::Boolean,
                matches:
                  T::Array[
                    ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match
                  ],
                probability: Float,
                type: Symbol,
                flagged_fields: T::Array[String]
              }
            )
          end
          def to_hash
          end

          class Match < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::Models::ContentSubmitResponse::Policy::EntityMatcherOutput::Match,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :match

            sig { returns(Float) }
            attr_accessor :probability

            sig { returns(T::Array[T.anything]) }
            attr_accessor :span

            sig do
              params(
                match: String,
                probability: Float,
                span: T::Array[T.anything]
              ).returns(T.attached_class)
            end
            def self.new(match:, probability:, span:)
            end

            sig do
              override.returns(
                {
                  match: String,
                  probability: Float,
                  span: T::Array[T.anything]
                }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::ContentSubmitResponse::Policy::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class Recommendation < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Recommendation,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The action to take based on the recommendation
        sig do
          returns(
            ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol
          )
        end
        attr_accessor :action

        # The reason code for the recommendation. Can be used to display a reason to the
        # user.
        sig do
          returns(
            T::Array[
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
            ]
          )
        end
        attr_accessor :reason_codes

        # The recommendation for the content based on the evaluation.
        sig do
          params(
            action:
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::OrSymbol,
            reason_codes:
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The action to take based on the recommendation
          action:,
          # The reason code for the recommendation. Can be used to display a reason to the
          # user.
          reason_codes:
        )
        end

        sig do
          override.returns(
            {
              action:
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol,
              reason_codes:
                T::Array[
                  ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
                ]
            }
          )
        end
        def to_hash
        end

        # The action to take based on the recommendation
        module Action
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REVIEW =
            T.let(
              :review,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol
            )
          ALLOW =
            T.let(
              :allow,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol
            )
          REJECT =
            T.let(
              :reject,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::Action::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module ReasonCode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SEVERITY_REJECT =
            T.let(
              :severity_reject,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
            )
          SEVERITY_REVIEW =
            T.let(
              :severity_review,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
            )
          AUTHOR_BLOCK =
            T.let(
              :author_block,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
            )
          DRY_RUN =
            T.let(
              :dry_run,
              ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ContentSubmitResponse::Recommendation::ReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Error < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ContentSubmitResponse::Error,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :message

        sig { params(id: String, message: String).returns(T.attached_class) }
        def self.new(id:, message:)
        end

        sig { override.returns({ id: String, message: String }) }
        def to_hash
        end
      end
    end
  end
end
