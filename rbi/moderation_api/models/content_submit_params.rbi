# typed: strong

module ModerationAPI
  module Models
    class ContentSubmitParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ContentSubmitParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The content sent for moderation
      sig do
        returns(
          T.any(
            ModerationAPI::ContentSubmitParams::Content::Text,
            ModerationAPI::ContentSubmitParams::Content::Image,
            ModerationAPI::ContentSubmitParams::Content::Video,
            ModerationAPI::ContentSubmitParams::Content::Audio,
            ModerationAPI::ContentSubmitParams::Content::ContentNode
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
          T.nilable(ModerationAPI::ContentSubmitParams::MetaType::OrSymbol)
        )
      end
      attr_reader :meta_type

      sig do
        params(
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol
        ).void
      end
      attr_writer :meta_type

      # Optionally override the channel policies for this moderation request only
      # (enterprise).
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember0,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember1,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember2,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember3,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember4,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember5,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember6,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember7,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember8,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember9,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember10,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember11,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember12,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember13,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember14,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember15,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember16,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember17,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember18,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember19,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember22
              )
            ]
          )
        )
      end
      attr_reader :policies

      sig do
        params(
          policies:
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember0::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember1::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember2::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember3::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember4::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember5::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember6::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember7::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember8::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember9::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember10::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember11::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember12::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember13::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember14::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember15::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember16::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember17::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember18::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember19::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember22::OrHash
              )
            ]
        ).void
      end
      attr_writer :policies

      sig do
        params(
          content:
            T.any(
              ModerationAPI::ContentSubmitParams::Content::Text::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Image::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Video::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Audio::OrHash,
              ModerationAPI::ContentSubmitParams::Content::ContentNode::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
          policies:
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember0::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember1::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember2::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember3::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember4::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember5::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember6::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember7::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember8::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember9::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember10::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember11::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember12::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember13::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember14::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember15::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember16::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember17::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember18::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember19::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember22::OrHash
              )
            ],
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
        # Optionally override the channel policies for this moderation request only
        # (enterprise).
        policies: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Text,
                ModerationAPI::ContentSubmitParams::Content::Image,
                ModerationAPI::ContentSubmitParams::Content::Video,
                ModerationAPI::ContentSubmitParams::Content::Audio,
                ModerationAPI::ContentSubmitParams::Content::ContentNode
              ),
            author_id: String,
            channel: String,
            content_id: String,
            conversation_id: String,
            do_not_store: T::Boolean,
            metadata: T::Hash[Symbol, T.anything],
            meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
            policies:
              T::Array[
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember0,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember1,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember2,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember3,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember4,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember5,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember6,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember7,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember8,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember9,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember10,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember11,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember12,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember13,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember14,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember15,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember16,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember17,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember18,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember19,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember22
                )
              ],
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
              ModerationAPI::ContentSubmitParams::Content::Text,
              ModerationAPI::ContentSubmitParams::Content::Image,
              ModerationAPI::ContentSubmitParams::Content::Video,
              ModerationAPI::ContentSubmitParams::Content::Audio,
              ModerationAPI::ContentSubmitParams::Content::ContentNode
            )
          end

        class Text < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Text,
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

        class Image < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Image,
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

        class Video < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Video,
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

        class Audio < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Audio,
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

        class ContentNode < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::ContentNode,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Values in the object. Can be mixed content types.
          sig do
            returns(
              T::Hash[
                Symbol,
                T.any(
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio
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
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio::OrHash
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
                      ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text,
                      ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image,
                      ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video,
                      ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio
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
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video,
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio
                )
              end

            class Text < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Text,
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
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Image,
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
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Video,
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
                    ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Audio,
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
                  ModerationAPI::ContentSubmitParams::Content::ContentNode::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::Content::Variants]
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
            T.all(Symbol, ModerationAPI::ContentSubmitParams::MetaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROFILE =
          T.let(
            :profile,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        MESSAGE =
          T.let(
            :message,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        POST =
          T.let(
            :post,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        COMMENT =
          T.let(
            :comment,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        EVENT =
          T.let(
            :event,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        PRODUCT =
          T.let(
            :product,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        REVIEW =
          T.let(
            :review,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        OTHER =
          T.let(
            :other,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Policy
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::ContentSubmitParams::Policy::UnionMember0,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember1,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember2,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember3,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember4,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember5,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember6,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember7,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember8,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember9,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember10,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember11,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember12,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember13,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember14,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember15,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember16,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember17,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember18,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember19,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember20,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember21,
              ModerationAPI::ContentSubmitParams::Policy::UnionMember22
            )
          end

        class UnionMember0 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember0,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :toxicity)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember1 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember1,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :personal_information)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember2 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember2,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :toxicity_severe)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember3 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember3,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :hate)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember4 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember4,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember5 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember5,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit_drugs)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember6 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember6,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit_alcohol)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember7 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember7,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit_firearms)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember8 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember8,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit_tobacco)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember9 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember9,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :illicit_gambling)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember10 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember10,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :sexual)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember11 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember11,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :flirtation)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember12 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember12,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :profanity)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember13 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember13,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :violence)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember14 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember14,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :self_harm)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember15 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember15,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :spam)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember16 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember16,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :self_promotion)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember17 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember17,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :political)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember18 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember18,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :religion)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember19 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember19,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { params(flag: T::Boolean, id: Symbol).returns(T.attached_class) }
          def self.new(flag:, id: :code_abuse)
          end

          sig { override.returns({ id: Symbol, flag: T::Boolean }) }
          def to_hash
          end
        end

        class UnionMember20 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig do
            returns(
              T::Hash[
                Symbol,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity
              ]
            )
          end
          attr_accessor :entities

          sig do
            params(
              entities:
                T::Hash[
                  Symbol,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::OrHash
                ],
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(entities:, id: :pii)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                entities:
                  T::Hash[
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity
                  ]
              }
            )
          end
          def to_hash
          end

          class Entity < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig do
              returns(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::OrSymbol
              )
            end
            attr_accessor :id

            sig { returns(T::Boolean) }
            attr_accessor :enable

            sig { returns(T::Boolean) }
            attr_accessor :flag

            sig { returns(T::Boolean) }
            attr_accessor :should_mask

            sig { returns(T.nilable(String)) }
            attr_reader :mask

            sig { params(mask: String).void }
            attr_writer :mask

            sig do
              params(
                id:
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::OrSymbol,
                enable: T::Boolean,
                flag: T::Boolean,
                should_mask: T::Boolean,
                mask: String
              ).returns(T.attached_class)
            end
            def self.new(id:, enable:, flag:, should_mask:, mask: nil)
            end

            sig do
              override.returns(
                {
                  id:
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::OrSymbol,
                  enable: T::Boolean,
                  flag: T::Boolean,
                  should_mask: T::Boolean,
                  mask: String
                }
              )
            end
            def to_hash
            end

            module ID
              extend ModerationAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EMAIL =
                T.let(
                  :email,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              PHONE =
                T.let(
                  :phone,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              URL =
                T.let(
                  :url,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              ADDRESS =
                T.let(
                  :address,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              NAME =
                T.let(
                  :name,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              USERNAME =
                T.let(
                  :username,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              IP_ADDRESS =
                T.let(
                  :ip_address,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              CREDIT_CARD =
                T.let(
                  :credit_card,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )
              SENSITIVE_OTHER =
                T.let(
                  :sensitive_other,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember20::Entity::ID::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class UnionMember21 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig do
            returns(
              T::Hash[
                Symbol,
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity
              ]
            )
          end
          attr_accessor :entities

          sig do
            params(
              entities:
                T::Hash[
                  Symbol,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::OrHash
                ],
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(entities:, id: :url)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                entities:
                  T::Hash[
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity
                  ]
              }
            )
          end
          def to_hash
          end

          class Entity < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig do
              returns(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::OrSymbol
              )
            end
            attr_accessor :id

            sig { returns(T::Boolean) }
            attr_accessor :enable

            sig { returns(T::Boolean) }
            attr_accessor :flag

            sig { returns(T::Boolean) }
            attr_accessor :should_mask

            sig { returns(T.nilable(String)) }
            attr_reader :mask

            sig { params(mask: String).void }
            attr_writer :mask

            sig do
              params(
                id:
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::OrSymbol,
                enable: T::Boolean,
                flag: T::Boolean,
                should_mask: T::Boolean,
                mask: String
              ).returns(T.attached_class)
            end
            def self.new(id:, enable:, flag:, should_mask:, mask: nil)
            end

            sig do
              override.returns(
                {
                  id:
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::OrSymbol,
                  enable: T::Boolean,
                  flag: T::Boolean,
                  should_mask: T::Boolean,
                  mask: String
                }
              )
            end
            def to_hash
            end

            module ID
              extend ModerationAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EMAIL =
                T.let(
                  :email,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              PHONE =
                T.let(
                  :phone,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              URL =
                T.let(
                  :url,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              ADDRESS =
                T.let(
                  :address,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              NAME =
                T.let(
                  :name,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              USERNAME =
                T.let(
                  :username,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              IP_ADDRESS =
                T.let(
                  :ip_address,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              CREDIT_CARD =
                T.let(
                  :credit_card,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )
              SENSITIVE_OTHER =
                T.let(
                  :sensitive_other,
                  ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ModerationAPI::ContentSubmitParams::Policy::UnionMember21::Entity::ID::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class UnionMember22 < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::UnionMember22,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(String) }
          attr_accessor :guideline_key

          sig { returns(String) }
          attr_accessor :instructions

          sig do
            params(
              flag: T::Boolean,
              guideline_key: String,
              instructions: String,
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(flag:, guideline_key:, instructions:, id: :guideline)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                flag: T::Boolean,
                guideline_key: String,
                instructions: String
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::Policy::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
