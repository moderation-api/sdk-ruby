# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeObjectParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ModerateAnalyzeObjectParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The object you want to analyze.
      sig { returns(ModerationAPI::ModerateAnalyzeObjectParams::Value) }
      attr_reader :value

      sig do
        params(
          value: ModerationAPI::ModerateAnalyzeObjectParams::Value::OrHash
        ).void
      end
      attr_writer :value

      # The author of the content.
      sig { returns(T.nilable(String)) }
      attr_reader :author_id

      sig { params(author_id: String).void }
      attr_writer :author_id

      # The key of the channel.
      sig { returns(T.nilable(String)) }
      attr_reader :channel_key

      sig { params(channel_key: String).void }
      attr_writer :channel_key

      # The unique ID of the content in your database.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # For example the ID of a chat room or a post
      sig { returns(T.nilable(String)) }
      attr_reader :context_id

      sig { params(context_id: String).void }
      attr_writer :context_id

      # Do not store the content. The content won't enter the review queue
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :do_not_store

      sig { params(do_not_store: T::Boolean).void }
      attr_writer :do_not_store

      # Any metadata you want to store with the content
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :metadata

      sig do
        params(
          value: ModerationAPI::ModerateAnalyzeObjectParams::Value::OrHash,
          author_id: String,
          channel_key: String,
          content_id: String,
          context_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The object you want to analyze.
        value:,
        # The author of the content.
        author_id: nil,
        # The key of the channel.
        channel_key: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        context_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            value: ModerationAPI::ModerateAnalyzeObjectParams::Value,
            author_id: String,
            channel_key: String,
            content_id: String,
            context_id: String,
            do_not_store: T::Boolean,
            metadata: T::Hash[Symbol, T.anything],
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Value < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::ModerateAnalyzeObjectParams::Value,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Hash[
              Symbol,
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Data
            ]
          )
        end
        attr_accessor :data

        # The type of the object you want to analyze.
        sig do
          returns(
            ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::OrSymbol
          )
        end
        attr_accessor :type

        # The object you want to analyze.
        sig do
          params(
            data:
              T::Hash[
                Symbol,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::OrHash
              ],
            type:
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # The type of the object you want to analyze.
          type:
        )
        end

        sig do
          override.returns(
            {
              data:
                T::Hash[
                  Symbol,
                  ModerationAPI::ModerateAnalyzeObjectParams::Value::Data
                ],
              type:
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        class Data < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The type of content (e.g., "text", "image", "video")
          sig do
            returns(
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::OrSymbol
            )
          end
          attr_accessor :type

          # The content to analyze
          sig { returns(String) }
          attr_accessor :value

          # Optional array of specific model IDs to use
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :model_ids

          sig { params(model_ids: T::Array[String]).void }
          attr_writer :model_ids

          sig do
            params(
              type:
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::OrSymbol,
              value: String,
              model_ids: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # The type of content (e.g., "text", "image", "video")
            type:,
            # The content to analyze
            value:,
            # Optional array of specific model IDs to use
            model_ids: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::OrSymbol,
                value: String,
                model_ids: T::Array[String]
              }
            )
          end
          def to_hash
          end

          # The type of content (e.g., "text", "image", "video")
          module Type
            extend ModerationAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::TaggedSymbol
              )
            AUDIO =
              T.let(
                :audio,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::ModerateAnalyzeObjectParams::Value::Data::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The type of the object you want to analyze.
        module Type
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROFILE =
            T.let(
              :profile,
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::TaggedSymbol
            )
          EVENT =
            T.let(
              :event,
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::TaggedSymbol
            )
          PRODUCT =
            T.let(
              :product,
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::TaggedSymbol
            )
          OBJECT =
            T.let(
              :object,
              ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::ModerateAnalyzeObjectParams::Value::Type::TaggedSymbol
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
