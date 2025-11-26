# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ModerateAnalyzeParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The content sent for moderation
      sig do
        returns(
          T.any(
            ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0,
            ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1,
            ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2,
            ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3,
            ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4
          )
        )
      end
      attr_accessor :content

      # The author of the content.
      sig { returns(T.nilable(String)) }
      attr_reader :author_id

      sig { params(author_id: String).void }
      attr_writer :author_id

      # Provide a channel ID or key. Will use the project's default channel if not
      # provided.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The unique ID of the content in your database.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # For example the ID of a chat room or a post
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

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

      # The meta type of content being moderated
      sig do
        returns(
          T.nilable(ModerationAPI::ModerateAnalyzeParams::MetaType::OrSymbol)
        )
      end
      attr_reader :meta_type

      sig do
        params(
          meta_type: ModerationAPI::ModerateAnalyzeParams::MetaType::OrSymbol
        ).void
      end
      attr_writer :meta_type

      sig do
        params(
          content:
            T.any(
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3::OrHash,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ModerateAnalyzeParams::MetaType::OrSymbol,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The content sent for moderation
        content:,
        # The author of the content.
        author_id: nil,
        # Provide a channel ID or key. Will use the project's default channel if not
        # provided.
        channel: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        conversation_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        # The meta type of content being moderated
        meta_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0,
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1,
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2,
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3,
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4
              ),
            author_id: String,
            channel: String,
            content_id: String,
            conversation_id: String,
            do_not_store: T::Boolean,
            metadata: T::Hash[Symbol, T.anything],
            meta_type: ModerationAPI::ModerateAnalyzeParams::MetaType::OrSymbol,
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The content sent for moderation
      module Content
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3,
              ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4
            )
          end

        class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember0,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The content text
          sig { returns(String) }
          attr_accessor :text

          sig { returns(Symbol) }
          attr_accessor :type

          # Text
          sig { params(text: String, type: Symbol).returns(T.attached_class) }
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

        class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember1,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A public URL of the image content
          sig { returns(String) }
          attr_accessor :url

          # Image
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
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

        class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember2,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A public URL of the video content
          sig { returns(String) }
          attr_accessor :url

          # Video
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
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

        class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember3,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The URL of the audio content
          sig { returns(String) }
          attr_accessor :url

          # Audio
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
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

        class UnionMember4 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Values in the object. Can be mixed content types.
          sig do
            returns(
              T::Hash[
                Symbol,
                T.any(
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember0,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember1,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember2,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember3
                )
              ]
            )
          end
          attr_accessor :data

          sig { returns(Symbol) }
          attr_accessor :type

          # Object
          sig do
            params(
              data:
                T::Hash[
                  Symbol,
                  T.any(
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember0::OrHash,
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember1::OrHash,
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember2::OrHash,
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember3::OrHash
                  )
                ],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Values in the object. Can be mixed content types.
            data:,
            type: :object
          )
          end

          sig do
            override.returns(
              {
                data:
                  T::Hash[
                    Symbol,
                    T.any(
                      ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember0,
                      ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember1,
                      ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember2,
                      ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember3
                    )
                  ],
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # Text
          module Data
            extend ModerationAPI::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember0,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember1,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember2,
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember3
                )
              end

            class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember0,
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

            class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember1,
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

            class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember2,
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

            class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::UnionMember3,
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
                  ModerationAPI::ModerateAnalyzeParams::Content::UnionMember4::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[ModerationAPI::ModerateAnalyzeParams::Content::Variants]
          )
        end
        def self.variants
        end
      end

      # The meta type of content being moderated
      module MetaType
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::ModerateAnalyzeParams::MetaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROFILE =
          T.let(
            :profile,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        MESSAGE =
          T.let(
            :message,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        POST =
          T.let(
            :post,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        COMMENT =
          T.let(
            :comment,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        EVENT =
          T.let(
            :event,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        PRODUCT =
          T.let(
            :product,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        REVIEW =
          T.let(
            :review,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )
        OTHER =
          T.let(
            :other,
            ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::ModerateAnalyzeParams::MetaType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
